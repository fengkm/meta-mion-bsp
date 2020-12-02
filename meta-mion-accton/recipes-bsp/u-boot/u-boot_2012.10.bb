require u-boot_2012.10.inc
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# This is needs to be validated among supported BSP's before we can
# make it default
DEFAULT_PREFERENCE = "-1"

LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"

# This revision corresponds to the tag "v2012.10"
# We use the revision in order to avoid having to fetch it from the
# repo during parse

SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-2012.10.tar.bz2 \
file://feature-dhcp-options.patch \ 
file://feature-save-default-env-on-bad-crc.patch \ 
file://feature-populate-serial-number.patch \ 
file://feature-sys-eeprom-tlv-common.patch \ 
file://feature-sys-eeprom-tlv.patch \ 
file://feature-fdt-environment-size.patch \ 
file://feature-allow-booting-without-fdt.patch \ 
file://feature-nand-support-larger-than-4gb.patch \ 
file://driver-support-new-broadcom-phys.patch \ 
file://platform-onie-common-env.patch \
file://platform-common-env.patch \
"

SRC_URI[sha256sum] = "dddec75070b5faa5df463085e3e1d27c6d058ec3481c666917baa961956d4d17"

S = "${WORKDIR}/git"
