# SPDX-License-Identifier: MIT 

FILESEXTRAPATHS_prepend := "${THISDIR}/${MACHINE}:"

KMACHINE_tn48m ?= "arm64"
KBRANCH_tn48m  ?= "v5.4/standard/base"

SRC_URI_append += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
            file://tn48m.cfg \
"
LINUX_VERSION = "5.4.69"

SRC_URI_append = "\
        ${@bb.utils.contains('DISTRO_FEATURES', 'powersave', ' file://power.cfg', '', d)}"

SRC_URI_append_tn48m = "\
    file://0005-fsl-ls1043a-rdb-sdk.patch \
    file://0006-fsl-ls1046a-rdb-sdk.patch \
    file://0007-qoriq-dpaa-eth.patch \
    file://0008-qorig-fman3-0-6oh.patch \
    file://0009-delta-tx4810-dts.patch \
    file://0010-wnc-qsd61-aom-a-48.patch \
    file://0011-wnc-qsa72-aom-a-48p.patch \
    file://0012-accton-as4224.patch \
    file://0013-delta-tn48m-series.patch \
"

SRCREV_machine_tn48m ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"

# Functionality flags
KERNEL_EXTRA_FEATURES_tn48m ?= "features/netfilter/netfilter.scc features/security/security.scc"

COMPATIBLE_MACHINE = "tn48m"

