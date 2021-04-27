SUMMARY = "This module supports to dump the onie syseeprom"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=a17b904394914df4199c25ca3c77e0d9"

inherit module

SRC_URI = " \
           file://Makefile \
           file://x86-64-ufispace-s9501-16smt-vpd.c \
           file://x86-64-ufispace-s9501-16smt-vpd.h \
           file://x86-64-ufispace-s9501-16smt-onie-tlvinfo.c \
           file://x86-64-ufispace-s9501-16smt-onie-tlvinfo.h \
           file://COPYING \
          "

S = "${WORKDIR}"

do_install() {
    install -d ${D}/lib/modules/${KERNEL_VERSION}/onl
    install -m 0644 x86-64-ufispace-s9501-16smt-onie-syseeprom.ko ${D}/lib/modules/${KERNEL_VERSION}/onl
}

#KERNEL_MODULE_AUTOLOAD += " x86-64-ufispace-s9501-16smt-onie-syseeprom"
