# SPDX-License-Identifier: MIT 

FILESEXTRAPATHS_prepend := "${THISDIR}/${MACHINE}:"

KMACHINE_ufispace-s9100-32x  ?= "common-pc-64"
KMACHINE_ufispace-s9700-53dx ?= "common-pc-64"

KBRANCH_ufispace-s9100-32x  ?= "v5.4/standard/base"
KBRANCH_ufispace-s9700-53dx ?= "v5.4/standard/base"

LINUX_VERSION_ufispace-s9100-32x  ?= "5.4.49"
LINUX_VERSION_ufispace-s9700-53dx ?= "5.4.49"

SRC_URI_append_ufispace-s9100-32x += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"

SRC_URI_append_ufispace-s9700-53dx += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"

SRC_URI_append = "\
        ${@bb.utils.contains('DISTRO_FEATURES', 'powersave', ' file://power.cfg', '', d)}"

SRCREV_machine_s9100-32x  ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9700-53dx ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"

# Functionality flags
KERNEL_EXTRA_FEATURES_ufispace-s9100-32x  ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9700-53dx ?= "features/netfilter/netfilter.scc features/security/security.scc"

COMPATIBLE_MACHINE = "(ufispace-s9100-32x|ufispace-s9700-53dx)"
 
