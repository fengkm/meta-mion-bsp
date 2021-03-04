# SPDX-License-Identifier: MIT 

FILESEXTRAPATHS_prepend_s9100-32x  := "${THISDIR}/${MACHINE}:"
FILESEXTRAPATHS_prepend_s9700-53dx := "${THISDIR}/${MACHINE}:"

SRCREV_s9100-32x  = "${AUTOREV}"
SRCREV_s9700-53dx = "${AUTOREV}"

SRCREV_onl_s9100-32x  = "${AUTOREV}"
SRCREV_onl_s9700-53dx = "${AUTOREV}"

SRCREV_infra_s9100-32x  = "8621a0bab76affaaad6dee0939fda0737c32c881"
SRCREV_infra_s9700-53dx = "8621a0bab76affaaad6dee0939fda0737c32c881"

SRCREV_bigcode_s9100-32x  = "981aee67ebf433d42f444d4faf1a46a596b39555"
SRCREV_bigcode_s9700-53dx = "981aee67ebf433d42f444d4faf1a46a596b39555"

ONL_BRANCH_s9100-32x  = "ufi"
ONL_BRANCH_s9700-53dx = "ufi"

URI_ONL_s9100-32x  = "git://github.com/fengkm/OpenNetworkLinux.git;branch=${ONL_BRANCH}"
URI_ONL_s9700-53dx = "git://github.com/fengkm/OpenNetworkLinux.git;branch=${ONL_BRANCH}"

TARGET_CFLAGS_s9100-32x  += "-Wno-error -Wno-error=restrict -Wno-error=format-overflow -Wno-error=cpp -Wno-error=unused-result"
TARGET_CFLAGS_s9700-53dx += "-Wno-error -Wno-error=restrict -Wno-error=format-overflow -Wno-error=cpp -Wno-error=unused-result"

SRC_URI_append_s9100-32x = " \
    file://0001-filter.patch  \
    file://0001-i2c-bigcode-use-libi2c-for-onlpdump-and-update-headers.patch;patchdir=${SUBMODULE_BIGCODE} \
    file://0001-i2c-infra-use-libi2c-for-onlpdump-and-update-headers.patch;patchdir=${SUBMODULE_INFRA} \
    file://0001-i2c-use-libi2c-for-onlpdump-and-update-headers.patch \
"

SRC_URI_append_s9700-53dx = " \
    file://0001-filter.patch  \
    file://0001-i2c-bigcode-use-libi2c-for-onlpdump-and-update-headers.patch;patchdir=${SUBMODULE_BIGCODE} \
    file://0001-i2c-infra-use-libi2c-for-onlpdump-and-update-headers.patch;patchdir=${SUBMODULE_INFRA} \
    file://0001-i2c-use-libi2c-for-onlpdump-and-update-headers.patch \
"

MODULE_s9100-32x  = "x86_64_ufispace_s9100_32x"
MODULE_s9700-53dx = "x86_64_ufispace_s9700_53dx"

EXTRA_OEMAKE_append_s9100-32x = "\
    'ARCH=amd64'\
"

EXTRA_OEMAKE_append_s9700-53dx = "\
    'ARCH=amd64'\
"

COMPATIBLE_MACHINE="(ufispace-s9100-32x|ufispace-s9700-53dx)"

#do_install_append_s9100-32x() {
#  # install platform.xml file
#  install -d ${D}/lib/platform-config/${ONL_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}-r${ONIE_MACHINE_REV}/onl/
#  install -m 0664 packages/platforms/${ONIE_VENDOR}/${ONL_ARCH}/${ONL_MACHINE}/platform-config/r0/src/lib/platform.xml ${D}/lib/platform-config/${ONL_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}-r${ONIE_MACHINE_REV}/onl/platform.xml
#}

#do_install_append_s9700-53dx() {
#  # install platform.xml file
#  install -d ${D}/lib/platform-config/${ONL_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}-r${ONIE_MACHINE_REV}/onl/
#  install -m 0664 packages/platforms/${ONIE_VENDOR}/${ONL_ARCH}/${ONL_MACHINE}/platform-config/r0/src/lib/platform.xml ${D}/lib/platform-config/${ONL_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}-r${ONIE_MACHINE_REV}/onl/platform.xml
#}

