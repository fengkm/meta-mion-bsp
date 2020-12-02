# SPDX-License-Identifier: MIT 

FILESEXTRAPATHS_prepend := "${THISDIR}/${MACHINE}:"
KMACHINE_accton-asgvolt64 ?= "common-pc-64"
KMACHINE_accton-as4610-30 ?= ""

KBRANCH_accton-asgvolt64  ?= "v5.4/standard/base"
KBRANCH_accton-as4610-30  ?= "v5.4/standard/base"

LINUX_VERSION_accton-asgvolt64 ?= "5.4.49"
LINUX_VERSION_accton-as4610-30 ?= "5.4.49"

SRC_URI_append_accton-asgvolt64 += "file://defconfig \
            file://veth.cfg \
            file://crypto.cfg \
"

SRC_URI_append_accton-as4610-30 += "file://defconfig \
            file://0001-Emulate-the-603-lwsync-instruction.patch \
            file://0002-Tweak-the-kernel-to-support-a-JTAG-hardware-debugger.patch \
file://0003-Copyright-C-2014-Curt-Brune-curt-cumulusnetworks.com.patch \
file://0004-Have-the-OS-set-up-all-PCI-device-maxpayload-and-max.patch \
file://0005-arch-intel-centerton-pci-id.patch.patch \
file://0006-Adjust-multi-byte-word-CFI-endianness-based-on-devic.patch \
file://0007-This-is-back-porting-the-i2c-mux-device-tree-binding.patch \
file://0008-Modify-the-pca954x-driver-to-check-for-the-deselect_.patch \
file://0009-The-P2020-platforms-have-a-broken-timeout-for-the-ES.patch \
file://0010-Back-port-i2c-ismt.c-bus-driver-for-Atom-CPUs.patch \
file://0011-Back-port-gpio-sch.c-driver-for-the-Intel-Centerton-.patch \
file://0012-Back-port-Intel-s-Multifunction-Device-MFD-driver.patch \
file://0013-Additional-Broadcom-PHY-support.patch \
file://0014-Patch-to-support-Intel-Avoton-Ethernet-driver-with-o.patch \
file://0015-driver-i2c-i801-support-intel-avoton.patch.patch \
file://0016-Back-port-mfd-lpc_ich.c-driver-for-Intel-Avoton.patch \
file://0017-Back-port-gpio-ich.c-driver-for-Intel-Avoton.patch \
file://0018-Support-for-Broadcom-iProc-ARM-Cortex-A9-based-Socs.patch \
file://0019-Broadcom-iProc-ARM-Cortex-A9-machine-specific-patche.patch \
file://0020-Broadcom-iProc-ARM-Cortex-A9-platform-specific-files.patch \
file://0021-Backport-of-vmalloc-related-patches-shown-below-into.patch \
file://0022-Broadcom-iProc-ARM-Cortex-A9-driver-support-top-leve.patch \
file://0023-Broadcom-iProc-ARM-Cortex-A9-DMA-driver.patch \
file://0024-Broadcom-iProc-ARM-Cortex-A9-GMAC-Ethernet-driver.patch \
file://0025-Broadcom-iProc-ARM-Cortex-A9-GPIO-driver.patch \
file://0026-Broadcom-iProc-ARM-Cortex-A9-MDIO-driver.patch \
file://0027-Broadcom-iProc-ARM-Cortex-A9-NAND-driver.patch \
file://0028-Broadcom-iProc-ARM-Cotex-A9-PCIe-driver.patch \
file://0029-Broadcom-iProc-ARM-Cortex-A9-PMU-driver.patch \
file://0030-Broadcom-iProc-ARM-Cortex-A9-PWM-driver.patch \
file://0031-Broadcom-iProc-ARM-Cortex-A9-QSPI-driver.patch \
file://0032-Broadcom-iProc-ARM-Cortex-A9-SMBus-Driver.patch \
file://0033-Broadcom-iProc-ARM-Cortex-A9-Timer-Driver.patch \
file://0034-Broadcom-iProc-ARM-Cortex-A9-USB2-Host-Driver.patch \
file://0035-Broadcom-iProc-ARM-Cortex-A9-Watchdog-Timer-Driver.patch \
file://0036-Changes-required-to-support-Broadcom-IPROC-architect.patch \
file://0037-Device-tree-framework-for-Broadcom-IPROC-helix4-base.patch \
file://0038-Support-for-Accton-AS4610-30-platform-ARM-Cortex-A9-.patch \
file://veth.cfg \
file://crypto.cfg \
"

SRC_URI_append = "\
        ${@bb.utils.contains('DISTRO_FEATURES', 'powersave', ' file://power.cfg', '', d)}"

SRCREV_machine_asgvolt64 ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
SRCREV_machine_as4610-30 ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"

# Functionality flags
KERNEL_EXTRA_FEATURES_accton-asgvolt64 ?= "features/netfilter/netfilter.scc features/security/security.scc"
KERNEL_EXTRA_FEATURES_accton-as4610-30 ?= "features/netfilter/netfilter.scc features/security/security.scc"


COMPATIBLE_MACHINE = "(accton-as4610-30|accton-asgvolt64)"
 
