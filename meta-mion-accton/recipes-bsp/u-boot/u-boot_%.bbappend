FILESEXTRAPATHS_prepend := "${THISDIR}/${MACHINE}:"
SRC_URI_accton-as4610-30 += "file://platform-as4610_30.patch"
UBOOT_MACHINE_accton-as4610-30 = "AS4610_30"

COMPATIBLE_MACHINE = "accton-as4610-30"
