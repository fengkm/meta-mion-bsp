# SPDX-License-Identifier: MIT 

SUMMARY = ""
LICENSE = "CLOSED"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

inherit systemd

SRC_URI += " \
    file://platform-ufispace-s9700-53dx-init.service \
    file://platform-ufispace-s9700-53dx-init.sh \
"

FILES_${PN} = " \
    ${systemd_system_unitdir}/platform-ufispace-s9700-53dx-init.service \
    ${bindir}/platform-ufispace-s9700-53dx-init.sh \
"


do_install() {
        install -d ${D}${systemd_system_unitdir}
        install -m 0644 ${WORKDIR}/platform-ufispace-s9700-53dx-init.service ${D}${systemd_system_unitdir}
        install -d ${D}${bindir}
        install -m 0755 ${WORKDIR}/platform-ufispace-s9700-53dx-init.sh ${D}${bindir}
}

SYSTEMD_SERVICE_${PN}_append = "platform-ufispace-s9700-53dx-init.service"