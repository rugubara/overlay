# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

At="${PN}_${PV}_${PR:1:4}-${PR:5:2}-${PR:7:2}"

DESCRIPTION="Steinberg ASIO SDK 2.3"
HOMEPAGE="http://www.steinberg.net/en/company/developer.html"
SRC_URI="${At}.zip"

RESTRICT="fetch"

LICENSE="STEINBERG-EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""
S="${WORKDIR}/ASIOSDK2"

pkg_nofetch() {
	einfo "1. Go to ${HOMEPAGE}"
	einfo "2. Download ASI SDK and"
	einfo "3. move ${At} to DISTDIR (usually /usr/portage/distfiles)"
	einfo
}

src_unpack() {
	unpack "${At}.zip" || die
}

src_install() {
	dodir "/opt/${PN}"
	mv ${At}/* "${D}/opt/${PN}"
}

pkg_postinst() {
	echo
	elog "${P} has been installed to /opt/${PN}"
	elog "To re-read the license please refer to"
	elog "/opt/${PN}/Steinberg ASIO Licensing Agreement.pdf"
	echo
}

