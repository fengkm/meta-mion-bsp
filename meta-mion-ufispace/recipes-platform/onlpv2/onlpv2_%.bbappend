# SPDX-License-Identifier: MIT 

FILESEXTRAPATHS_prepend_s9100-32x  := "${THISDIR}/${MACHINE}:"
FILESEXTRAPATHS_prepend_s9700-53dx := "${THISDIR}/${MACHINE}:"

SRCREV_s9100-32x  = "${AUTOREV}"
SRCREV_s9700-53dx = "${AUTOREV}"

SRCREV_onl_s9100-32x  = "${AUTOREV}"
SRCREV_onl_s9700-53dx = "${AUTOREV}"

SRCREV_infra_s9100-32x  = "16ce9cd77f6639aac4813d698f9dd11f3ee47e7a"
SRCREV_infra_s9700-53dx = "16ce9cd77f6639aac4813d698f9dd11f3ee47e7a"

SRCREV_bigcode_s9100-32x  = "94091600faa76fac492b4be2ffab17cb9788d697"
SRCREV_bigcode_s9700-53dx = "94091600faa76fac492b4be2ffab17cb9788d697"


ONL_BRANCH_s9100-32x  = "onf-ONLPv2"
ONL_BRANCH_s9700-53dx = "onf-ONLPv2"

URI_ONL_s9100-32x  = "git://github.com/fengkm/OpenNetworkLinux.git;branch=${ONL_BRANCH}"
URI_ONL_s9700-53dx = "git://github.com/fengkm/OpenNetworkLinux.git;branch=${ONL_BRANCH}"

TARGET_CFLAGS_s9100-32x  += "-Wno-error -Wno-error=restrict -Wno-error=format-overflow -Wno-error=cpp -Wno-error=unused-result"
TARGET_CFLAGS_s9700-53dx += "-Wno-error -Wno-error=restrict -Wno-error=format-overflow -Wno-error=cpp -Wno-error=unused-result"

#SRC_URI_append_s9100-32x = " \ 
#"

MODULE_s9100-32x  = "x86_64_ufispace_s9100_32x"
MODULE_s9700-53dx = "x86_64_ufispace_s9700_53dx"

EXTRA_OEMAKE += "\
    'ARCH=amd64'\
    'UCLIHANDLERS2=${S}/sm/bigcode/tools/uclihandlers2.py'\
    'SUBMODULE_INFRA=${S}/sm/infra'\
"

COMPATIBLE_MACHINE = "(ufispace-s9100-32x|ufispace-s9700-53dx)"

#do_install_append_s9100-32x() {
#  # install platform.xml file
#  install -d ${D}/lib/platform-config/${ONL_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}-r${ONIE_MACHINE_REV}/onl/
#  install -m 0664 packages/platforms/${ONIE_VENDOR}/${ONL_ARCH}/${ONL_MACHINE}/platform-config/r0/src/lib/x86-64-ufispace-s9100-32x-r0.yml ${D}/lib/platform-config/${ONL_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}-r${ONIE_MACHINE_REV}/onl/x86-64-ufispace-s9100-32x-r0.yml
#}

#do_install_append_s9700-53dx() {
#  # install platform.xml file
#  install -d ${D}/lib/platform-config/${ONL_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}-r${ONIE_MACHINE_REV}/onl/
#  install -m 0664 packages/platforms/${ONIE_VENDOR}/${ONL_ARCH}/${ONL_MACHINE}/platform-config/r0/src/lib/x86-64-ufispace-s9700-53dx-r0.yml ${D}/lib/platform-config/${ONL_ARCH}-${ONL_VENDOR}-${ONL_MACHINE}-r${ONIE_MACHINE_REV}/onl/x86-64-ufispace-s9700-53dx-r0.yml
#}

