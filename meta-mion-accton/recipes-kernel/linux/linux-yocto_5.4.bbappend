# SPDX-License-Identifier: MIT 

FILESEXTRAPATHS_prepend := "${THISDIR}/${MACHINE}:"
KMACHINE_accton-asgvolt64 ?= "common-pc-64"
KMACHINE_accton-as4610-30 ?= ""

KBRANCH_accton-asgvolt64  ?= "v5.4/standard/base"
KBRANCH_accton-as4610-30  ?= "v5.4/standard/base"

LINUX_VERSION_accton-asgvolt64 ?= "5.4.49"
LINUX_VERSION_accton-as4610-30 ?= "5.4.49"

SRC_URI_append_accton-asgvolt64 += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"

SRC_URI_append_accton-as4610-30 += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"

SRC_URI_append = "\
        ${@bb.utils.contains('DISTRO_FEATURES', 'powersave', ' file://power.cfg', '', d)}"

SRCREV_machine_asgvolt64 ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_as4610-30 ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"

# Functionality flags
KERNEL_EXTRA_FEATURES_accton-asgvolt64 ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_accton-as4610-30 ?= "features/netfilter/netfilter.scc features/security/security.scc"


COMPATIBLE_MACHINE = "(accton-as4610-30|accton-asgvolt64)"
 
