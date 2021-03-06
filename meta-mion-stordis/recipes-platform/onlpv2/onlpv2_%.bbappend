# SPDX-License-Identifier: MIT 

FILESEXTRAPATHS_prepend_bf2556x := "${THISDIR}/${MACHINE}:"
FILESEXTRAPATHS_prepend_bf6064x := "${THISDIR}/${MACHINE}:"

ONL_BRANCH_bf2556x = "main"
ONL_BRANCH_bf6064x = "main"

URI_ONL_bf2556x = "git://github.com/NetworkGradeLinux/APSN-ONL2.git;branch=${ONL_BRANCH}"
URI_ONL_bf6064x = "git://github.com/NetworkGradeLinux/APSN-ONL2.git;branch=${ONL_BRANCH}"

MODULE_bf2556x="x86_64_stordis_bf2556x_1t"
MODULE_bf6064x="x86_64_stordis_bf6064x_t"

EXTRA_OEMAKE += "\
    'ARCH=amd64'\
    'UCLIHANDLERS2=${S}/sm/bigcode/tools/uclihandlers2.py'\
    'SUBMODULE_INFRA=${S}/sm/infra'\
"

COMPATIBLE_MACHINE = "(stordis-bf2556x-1t|stordis-bf6064x-t)"

SRC_URI_append_bf2556x = " \
    file://0001-Add-i2c-smbus.h-to-vendor_driver_pool.c.patch \
"

SRC_URI_append_bf6064x = " \
    file://0001-Add-i2c-smbus.h-to-vendor_driver_pool.c.patch \
"


