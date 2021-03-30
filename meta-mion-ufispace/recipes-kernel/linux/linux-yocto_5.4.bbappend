# SPDX-License-Identifier: MIT 

FILESEXTRAPATHS_prepend := "${THISDIR}/${MACHINE}:"


KMACHINE_ufispace-s9100-32x    ?= "common-pc-64"
KMACHINE_ufispace-s9310-32d    ?= "common-pc-64"
KMACHINE_ufispace-s9501-16smt  ?= "common-pc-64"
KMACHINE_ufispace-s9501-18smt  ?= "common-pc-64"
KMACHINE_ufispace-s9501-28smt  ?= "common-pc-64"
KMACHINE_ufispace-s9600-48x    ?= "common-pc-64"
KMACHINE_ufispace-s9600-64x    ?= "common-pc-64"
KMACHINE_ufispace-s9600-72xc   ?= "common-pc-64"
KMACHINE_ufispace-s9700-23d    ?= "common-pc-64"
KMACHINE_ufispace-s9700-53dx   ?= "common-pc-64"
KMACHINE_ufispace-s9701-78dc   ?= "common-pc-64"
KMACHINE_ufispace-s9705-48d    ?= "common-pc-64"
KMACHINE_ufispace-s9710-76d    ?= "common-pc-64"


KBRANCH_ufispace-s9100-32x    ?= "v5.4/standard/base"
KBRANCH_ufispace-s9310-32d    ?= "v5.4/standard/base"
KBRANCH_ufispace-s9501-16smt  ?= "v5.4/standard/base"
KBRANCH_ufispace-s9501-18smt  ?= "v5.4/standard/base"
KBRANCH_ufispace-s9501-28smt  ?= "v5.4/standard/base"
KBRANCH_ufispace-s9600-48x    ?= "v5.4/standard/base"
KBRANCH_ufispace-s9600-64x    ?= "v5.4/standard/base"
KBRANCH_ufispace-s9600-72xc   ?= "v5.4/standard/base"
KBRANCH_ufispace-s9700-23d    ?= "v5.4/standard/base"
KBRANCH_ufispace-s9700-53dx   ?= "v5.4/standard/base"
KBRANCH_ufispace-s9701-78dc   ?= "v5.4/standard/base"
KBRANCH_ufispace-s9705-48d    ?= "v5.4/standard/base"
KBRANCH_ufispace-s9710-76d    ?= "v5.4/standard/base"


LINUX_VERSION_ufispace-s9100-32x    ?= "5.4.49"
LINUX_VERSION_ufispace-s9310-32d    ?= "5.4.49"
LINUX_VERSION_ufispace-s9501-16smt  ?= "5.4.49"
LINUX_VERSION_ufispace-s9501-18smt  ?= "5.4.49"
LINUX_VERSION_ufispace-s9501-28smt  ?= "5.4.49"
LINUX_VERSION_ufispace-s9600-48x    ?= "5.4.49"
LINUX_VERSION_ufispace-s9600-64x    ?= "5.4.49"
LINUX_VERSION_ufispace-s9600-72xc   ?= "5.4.49"
LINUX_VERSION_ufispace-s9700-23d    ?= "5.4.49"
LINUX_VERSION_ufispace-s9700-53dx   ?= "5.4.49"
LINUX_VERSION_ufispace-s9701-78dc   ?= "5.4.49"
LINUX_VERSION_ufispace-s9705-48d    ?= "5.4.49"
LINUX_VERSION_ufispace-s9710-76d    ?= "5.4.49"


SRC_URI_append_ufispace-s9100-32x    += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"
SRC_URI_append_ufispace-s9310-32d    += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"
SRC_URI_append_ufispace-s9501-16smt  += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"
SRC_URI_append_ufispace-s9501-18smt  += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"
SRC_URI_append_ufispace-s9501-28smt  += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"
SRC_URI_append_ufispace-s9600-48x    += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"
SRC_URI_append_ufispace-s9600-64x    += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"
SRC_URI_append_ufispace-s9600-72xc   += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"
SRC_URI_append_ufispace-s9700-23d    += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"
SRC_URI_append_ufispace-s9700-53dx   += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"
SRC_URI_append_ufispace-s9701-78dc   += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"
SRC_URI_append_ufispace-s9705-48d    += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"
SRC_URI_append_ufispace-s9710-76d    += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"


SRC_URI_append = "\
        ${@bb.utils.contains('DISTRO_FEATURES', 'powersave', ' file://power.cfg', '', d)}"


SRCREV_machine_s9100-32x    ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9310-32d    ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9501-16smt  ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9501-18smt  ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9501-28smt  ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9600-48x    ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9600-64x    ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9600-72xc   ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9700-23d    ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9700-53dx   ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9701-78dc   ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9705-48d    ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_s9710-76d    ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"


# Functionality flags
KERNEL_EXTRA_FEATURES_ufispace-s9100-32x    ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9310-32d    ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9501-16smt  ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9501-18smt  ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9501-28smt  ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9600-48x    ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9600-64x    ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9600-72xc   ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9700-23d    ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9700-53dx   ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9701-78dc   ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9705-48d    ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_ufispace-s9710-76d    ?= "features/netfilter/netfilter.scc features/security/security.scc"


COMPATIBLE_MACHINE = "(ufispace-s9100-32x.conf|ufispace-s9310-32d.conf|ufispace-s9501-16smt.conf|ufispace-s9501-18smt.conf|ufispace-s9501-28smt.conf|ufispace-9600-48x.conf|ufispace-s9600-64x.conf|ufispace-s9600-72xc.conf|ufispace-s9700-23d.conf|ufispace-s9700-53dx.conf|ufispace-s9701-78dc.conf|ufispace-s9705-48d.conf|ufispace-s9710-76d.conf)"
 
