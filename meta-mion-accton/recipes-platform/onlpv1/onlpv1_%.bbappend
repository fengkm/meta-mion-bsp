# SPDX-License-Identifier: MIT 

FILESEXTRAPATHS_prepend_asgvolt64 := "${THISDIR}/${MACHINE}:"
FILESEXTRAPATHS_prepend_as4610-30 := "${THISDIR}/${MACHINE}:"

SRCREV_asgvolt64 = "${AUTOREV}"
SRCREV_as4610-30 = "${AUTOREV}"

SRCREV_onl_asgvolt64 = "${AUTOREV}"
SRCREV_onl_as4610-30 = "${AUTOREV}"

SRCREV_infra_asgvolt64 = "16ce9cd77f6639aac4813d698f9dd11f3ee47e7a"
SRCREV_infra_as4610-30 = "16ce9cd77f6639aac4813d698f9dd11f3ee47e7a"

SRCREV_bigcode_asgvolt64 = "94091600faa76fac492b4be2ffab17cb9788d697"
SRCREV_bigcode_as4610-30 = "94091600faa76fac492b4be2ffab17cb9788d697"

ONL_BRANCH_asgvolt64 = "master"
ONL_BRANCH_as4610-30 = "master"

SRC_URI_append_asgvolt64 = " \
    file://filter.patch \
    file://0001-i2c-bigcode-use-libi2c-for-onlpdump-and-update-headers.patch;patchdir=${SUBMODULE_BIGCODE} \
    file://0001-i2c-infra-use-libi2c-for-onlpdump-and-update-headers.patch;patchdir=${SUBMODULE_INFRA} \
    file://0001-i2c-use-libi2c-for-onlpdump-and-update-headers.patch \
"

SRC_URI_append_as4610-30 = " \
    file://filter.patch \
    file://0001-i2c-bigcode-use-libi2c-for-onlpdump-and-update-headers.patch;patchdir=${SUBMODULE_BIGCODE} \
    file://0001-i2c-infra-use-libi2c-for-onlpdump-and-update-headers.patch;patchdir=${SUBMODULE_INFRA} \
    file://0001-i2c-use-libi2c-for-onlpdump-and-update-headers.patch \
"

MODULE_asgvolt64 = "x86_64_accton_asgvolt64"
MODULE_as4610-30 = "x86_64_accton_as4610_30"

EXTRA_OEMAKE_append_asgvolt64 = "\
    'ARCH=amd64'\
"

EXTRA_OEMAKE_append_as4610-30 = "\
    'ARCH=armhf'\
"

TARGET_CFLAGS_as4610-30 += "-Wno-error -Wno-error=restrict -Wno-error=format-overflow -Wno-error=cpp"

do_compile_as4610-30() {
    V=1 VERBOSE=1 oe_runmake -C packages/base/any/onlp/builds alltargets
    V=1 VERBOSE=1 oe_runmake -C packages/base/any/onlp/builds/onlpd alltargets
    V=1 VERBOSE=1 oe_runmake -C packages/platforms/${ONIE_VENDOR}/${ONL_ARCH}/as4610/${ONL_MACHINE}/onlp/builds alltargets
}

do_install_as4610-30() {

    install -d \
    ${D}${bindir} \
    ${D}${includedir}/AIM \
    ${D}${includedir}/BigList \
    ${D}${includedir}/IOF \
    ${D}${includedir}/cjson \
    ${D}${includedir}/onlp \
    ${D}${includedir}/onlplib \
    ${D}${libdir} \

    # This is stupid and lazy and I'm working around ONLP stuff.

    install -d ${D}/lib/${ONIE_ARCH}-linux-gnu

    #install platform config and onlpdump
    # /lib/platform-config/
    # ├── current -> x86-64-accton-asgvolt64-r0
    # └── x86-64-accton-asgvolt64-r0
    #     └── onl
    #         ├── bin
    #         │   └── onlpdump
    #         ├── lib
    #         │   └── libonlp-x86-64-accton-asgvolt64.so 
    #         └── x86-64-accton-asgvolt64-r0.yml 
    
    # /lib first
    install -d \
        ${D}/lib/platform-config/${TARGET_ARCH}_${ONL_VENDOR}_${ONL_MACHINE}_r${ONIE_MACHINE_REV}/onl/bin \
        ${D}/lib/platform-config/${TARGET_ARCH}_${ONL_VENDOR}_${ONL_MACHINE}_r${ONIE_MACHINE_REV}/onl/lib

    # .so file
    install -m 0755 packages/platforms/${ONIE_VENDOR}/${ONL_ARCH}/as4610/${ONL_MACHINE}/onlp/builds/lib/BUILD/${ONL_DEBIAN_SUITE}/${TOOLCHAIN}/bin/libonlp-${TARGET_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}.so ${D}/lib/platform-config/${TARGET_ARCH}_${ONL_VENDOR}_${ONL_MACHINE}_r${ONIE_MACHINE_REV}/onl/lib

    # platform yml file
    install -m 0755 packages/platforms/${ONIE_VENDOR}/${ONL_ARCH}/as4610/${ONL_MACHINE}/platform-config/r${ONIE_MACHINE_REV}/src/lib/${TARGET_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}-r${ONIE_MACHINE_REV}.yml ${D}/lib/platform-config/${TARGET_ARCH}_${ONL_VENDOR}_${ONL_MACHINE}_r${ONIE_MACHINE_REV}/onl

    # this is a dangerous hack
    sed -i '/kernel-4-14/d' ${D}/lib/platform-config/${TARGET_ARCH}_${ONL_VENDOR}_${ONL_MACHINE}_r${ONIE_MACHINE_REV}/onl/${TARGET_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}-r${ONIE_MACHINE_REV}.yml

    sed -i '/:kernel/d' ${D}/lib/platform-config/${TARGET_ARCH}_${ONL_VENDOR}_${ONL_MACHINE}_r${ONIE_MACHINE_REV}/onl/${TARGET_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}-r${ONIE_MACHINE_REV}.yml

    # install onlpdump in bindir and link to lib/platformconf/*/onl/bin
    # Some code needs to go here to figure out if it's onlpdump or onlps. for now assume onlps.
    install -d ${D}${bindir} \
        ${D}${libdir} 

    install -m 0755 packages/platforms/${ONIE_VENDOR}/${ONL_ARCH}/as4610/${ONL_MACHINE}/onlp/builds/onlpdump/BUILD/${ONL_DEBIAN_SUITE}/${TOOLCHAIN}/bin/onlps ${D}${bindir}
    ln -r -s ${D}${bindir}/onlps ${D}/lib/platform-config/${TARGET_ARCH}_${ONL_VENDOR}_${ONL_MACHINE}_r${ONIE_MACHINE_REV}/onl/bin/onlps

    # install onlpdump.py and libs
    install -d \ 
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onlp \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onl \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/pki \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/platform \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/platform/${ONL_VENDOR} \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/platform/${TARGET_ARCH}_${ONL_VENDOR}_${ONL_MACHINE}_r${ONIE_MACHINE_REV} \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onlp/onlp \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onlp/onlplib \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onlp/sff \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onlp/test \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/sysconfig \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/uboot \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/upgrade \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/util \
        ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/versions

    # install onlpdump.py
    install -m 0755 packages/base/any/onlp/src/onlpdump.py ${D}${bindir}
    # install onlp modules
    install -m 0755 packages/base/any/onlp/src/onlp/module/python/onlp/__init__.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onlp/
    install -m 0755 packages/base/any/onlp/src/onlp/module/python/onlp/onlp/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onlp/onlp/
    install -m 0755 packages/base/any/onlp/src/onlp/module/python/onlp/test/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onlp/test/

    #install all the base python modules
    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/__init__.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl

    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/YamlUtils.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl

    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/bootconfig
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/bootconfig/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/bootconfig

    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/versions
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/versions/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/versions

    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/pki
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/pki/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/pki

    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/platform
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/platform/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/platform

    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/sysconfig
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/sysconfig/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/sysconfig

    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/util
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/util/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/util

    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/upgrade
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/upgrade/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/upgrade

    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/network
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/network/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/network

    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/grub
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/grub/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/grub

    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/mounts
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/mounts/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/mounts


    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install
    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/plugins
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/plugins/__init__.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/plugins

    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/App.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/BaseInstall.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/BaseRecovery.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/ConfUtils.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/Fit.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/InstallUtils.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/Legacy.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/Plugin.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/RecoverApp.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/ShellApp.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/SystemInstall.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/install/__init__.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/install/

    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/uboot
    install -m 755 packages/base/all/vendor-config-onl/src/python/onl/uboot/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/uboot
    
    # install platform cruft
    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/platform/${ONIE_VENDOR}/
    install -m 755 packages/platforms/${ONIE_VENDOR}/vendor-config/src/python/${ONIE_VENDOR}/__init__.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/platform/${ONIE_VENDOR}/

    install -d ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/platform/${TARGET_ARCH}_${ONL_VENDOR}_${ONIE_MACHINE}_r${ONIE_MACHINE_REV}/
    install -m 755 packages/platforms/${ONIE_VENDOR}/${ONL_ARCH}/as4610/${ONL_MACHINE}/platform-config/r${ONIE_MACHINE_REV}/src/python/${TARGET_ARCH}_${ONL_VENDOR}_${ONIE_MACHINE}_r${ONIE_MACHINE_REV}/__init__.py ${D}/${libdir}/python${PYTHON_MAJMIN}/onl/platform/${TARGET_ARCH}_${ONIE_VENDOR}_${ONIE_MACHINE}_r${ONIE_MACHINE_REV}/

    install -m 0644 packages/base/any/onlp/src/onlp/module/inc/onlp/*.h ${D}${includedir}/onlp/

    # install onlplib modules
    install -m 0755 packages/base/any/onlp/src/onlplib/module/python/onlp/onlplib/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onlp/onlplib/
    # install headers
    install -m 0644 packages/base/any/onlp/src/onlplib/module/inc/onlplib/*.h ${D}${includedir}/onlplib/

    install -m 0755 sm/bigcode/modules/sff/module/python/sff/* ${D}/${libdir}/python${PYTHON_MAJMIN}/onlp/sff
    # install headers
    install -m 0644 sm/bigcode/modules/BigData/BigList/module/inc/BigList/*.h ${D}${includedir}/BigList/
    install -m 0644 sm/bigcode/modules/IOF/module/inc/IOF/*.h ${D}${includedir}/IOF/
    install -m 0644 sm/bigcode/modules/cjson/module/inc/cjson/*.h ${D}${includedir}/cjson/
    install -m 0644 sm/infra/modules/AIM/module/inc/AIM/*.h ${D}${includedir}/AIM/

    # install libonlp-platform shared library (includes AIM.a  AIM_posix.a  BigList.a  cjson.a  cjson_util.a  IOF.a  onlplib.a  x86_64_delta_ag7648.a)
    #
    install -m 0755 packages/platforms/${ONIE_VENDOR}/${ONL_ARCH}/as4610/${ONL_MACHINE}/onlp/builds/lib/BUILD/${ONL_DEBIAN_SUITE}/${TOOLCHAIN}/bin/libonlp-${TARGET_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}.so ${D}${libdir}
    mv ${D}${libdir}/libonlp-${TARGET_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}.so ${D}${libdir}/libonlp-${TARGET_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}.so.1
    ln -r -s ${D}${libdir}/libonlp-${TARGET_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}.so.1 ${D}${libdir}/libonlp-${TARGET_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}.so
    ln -r -s ${D}${libdir}/libonlp-${TARGET_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}.so.1 ${D}${libdir}/libonlp-platform.so.1

    # install libonlp shared library (includes TODO)
    install -m 0755 packages/base/any/onlp/builds/onlp/BUILD/${ONL_DEBIAN_SUITE}/${TOOLCHAIN}/bin/libonlp.so ${D}${libdir}
    mv ${D}${libdir}/libonlp.so ${D}${libdir}/libonlp.so.1
    ln -r -s ${D}${libdir}/libonlp.so.1 ${D}${libdir}/libonlp.so

    # install libonlp shared library (includes TODO)
    install -m 0755 packages/base/any/onlp/builds/onlp-platform-defaults/BUILD/${ONL_DEBIAN_SUITE}/${TOOLCHAIN}/bin/libonlp-platform-defaults.so ${D}${libdir}
    mv ${D}${libdir}/libonlp-platform-defaults.so ${D}${libdir}/libonlp-platform-defaults.so.1
    ln -r -s ${D}${libdir}/libonlp-platform-defaults.so.1 ${D}${libdir}/libonlp-platform-defaults.so

    # onlpdump service file
    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/onlpdump.service ${D}${systemd_unitdir}/system

    # onl platform conf 
    install -d ${D}${sysconfdir}/onl
    echo "${ONL_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}-r${ONIE_MACHINE_REV}" > ${D}${sysconfdir}/onl/platform

    # onl-platform-baseconf
    install -d ${D}${sysconfdir}/baseconf
    install -m 0755 packages/base/all/vendor-config-onl/src/boot.d/51.onl-platform-baseconf ${D}${sysconfdir}/baseconf/onl-platform-baseconf.py
    install -m 0644 ${WORKDIR}/baseconf.service ${D}${systemd_unitdir}/system

    # fix up bindir and sysconfdir
    sed -i -e 's,@BINDIR@,${bindir},g' \
         ${D}${systemd_unitdir}/system/*.service
    sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
         ${D}${systemd_unitdir}/system/*.service

}

COMPATIBLE_MACHINE = "(accton-as4610-30|accton-asgvolt64)"
