SUMMARY = "This module supports cpld that read and write via lpc interface"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=a17b904394914df4199c25ca3c77e0d9"

inherit module

SRC_URI = " \
           file://Makefile \
           file://x86-64-ufispace-s9700-23d-lpc.c \
           file://COPYING \
          "

S = "${WORKDIR}"

do_install() {
    install -d ${D}/lib/modules/${KERNEL_VERSION}/onl
    install -m 0644 x86-64-ufispace-s9700-23d-lpc.ko ${D}/lib/modules/${KERNEL_VERSION}/onl
}

#KERNEL_MODULE_AUTOLOAD += " x86-64-ufispace-s9700-23d-lpc"
