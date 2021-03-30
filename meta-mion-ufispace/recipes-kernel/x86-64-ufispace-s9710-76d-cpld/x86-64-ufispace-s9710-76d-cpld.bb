SUMMARY = "This module supports cpld that read and write"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=1fd981d5519f34dc9b9056545aa2b87f"

inherit module

SRC_URI = " \
           file://Makefile \
           file://x86-64-ufispace-s9710-76d-cpld.c \
           file://x86-64-ufispace-s9710-76d-cpld.h \
           file://COPYING \
          "

S = "${WORKDIR}"

do_install() {
    install -d ${D}/lib/modules/${KERNEL_VERSION}/onl
    install -m 0644 x86-64-ufispace-s9710-76d-cpld.ko ${D}/lib/modules/${KERNEL_VERSION}/onl
}

#KERNEL_MODULE_AUTOLOAD += " x86-64-ufispace-s9710-76d-cpld"
