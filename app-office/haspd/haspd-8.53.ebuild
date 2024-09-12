# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm udev pam systemd tmpfiles unpacker 

DESCRIPTION="Sentinel HASP drivers for USB keys"
HOMEPAGE="https://supportportal.thalesgroup.com"
SRC_URI="http://ftp.etersoft.ru/pub/Etersoft/HASP/${PV}/sources/haspd-${PV}-alt1.src.rpm"
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist mirror"

RDEPEND=""

QA_PREBUILT="*"

src_unpack() {
	rpm_src_unpack ${A}
	unpack "${WORKDIR}/${PN}-${PV}.tar"
	cd "${S}"
}


src_install() {
	dodoc LICENSE.UTF-8.txt
	dodoc -r doc

	newsbin aksusbd/aksusbd_x86_64 aksusbd
	systemd_dounit aksusbd/aksusbd.service
	udev_dorules aksusbd/udev/rules.d/80-hasp.rules
	
	dodoc hasplmd/readme.html
	newsbin hasplmd/hasplmd_x86_64 hasplmd
	systemd_dounit hasplmd/hasplmd.service

	elog "Install phase completed"
}

pkg_postinst() {
	udev_reload
	elog "postinst phase completed"
}

pkg_postrm() {
	udev_reload
	elog "postrm phase completed"
}
