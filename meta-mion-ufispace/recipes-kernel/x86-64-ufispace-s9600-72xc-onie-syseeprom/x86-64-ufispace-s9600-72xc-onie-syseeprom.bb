SUMMARY = "This module supports to dump the onie syseeprom"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=1fd981d5519f34dc9b9056545aa2b87f"

inherit module

SRC_URI = " \
           file://Makefile \
           file://x86-64-ufispace-s9600-72xc-vpd.c \
           file://x86-64-ufispace-s9600-72xc-vpd.h \
           file://x86-64-ufispace-s9600-72xc-onie-tlvinfo.c \
           file://x86-64-ufispace-s9600-72xc-onie-tlvinfo.h \
           file://COPYING \
          "

S = "${WORKDIR}"

do_install() {
    install -d ${D}/lib/modules/${KERNEL_VERSION}/onl
    install -m 0644 x86-64-ufispace-s9600-72xc-onie-syseeprom.ko ${D}/lib/modules/${KERNEL_VERSION}/onl
}

#KERNEL_MODULE_AUTOLOAD += " x86-64-ufispace-s9600-72xc-onie-syseeprom"
