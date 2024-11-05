# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

inherit desktop xdg-utils unpacker
#inherit eutils pax-utils rpm 


DESCRIPTION="Native linux client of Vmware Horizon"
HOMEPAGE="http://v8.1c.ru/"

#MY_PV="$(ver_rs 3 '-' )"
#MY_PN="1c-enterprise"

SRC_URI="${PN}-2312.1-${PV}-23543969.x64.deb"
		

SLOT=0
#LICENSE="1CEnterprise_en"
KEYWORDS="amd64"
RESTRICT="fetch strip"

#IUSE="+nls"
#	~app-office/1C_Enterprise-common-${PV}:${SLOT}
#	~app-office/1C_Enterprise-server-${PV}:${SLOT}

RDEPEND=""

DEPEND="${RDEPEND}"

#S="${WORKDIR}"

dolib_r() { # accepts the directory to install libraries into /usr/lib
	if [ -d "${1}" ]; then
		into "/${1}"
		insinto "/${1}"
		for f in "${1}"/*; do
			if [ -d "${f}" ]; then
				dolib_r "${f}" 
			else
				case "${f}" in
					*.so*)
						dolib.so "${f}"
						;;
					*)
						if [ -x "${f}" ]; then
							dobin "${f}"
						else
							doins "${f}"
						fi
						;;
				esac
			fi
		done
	fi
}

src_unpack() {
	mkdir ${WORKDIR}/${P}
	cd ${WORKDIR}/${P}
	unpack_deb ${A}
}

src_install() {
	insinto "/etc"
	doins -r "etc/vmware"
	insinto "/usr/share"
	doins -r "usr/share/X11"
	doins -r "usr/share/locale"
	doins -r "usr/share/doc"
	doicon "usr/share/icons/vmware-view.png"
	domenu "usr/share/applications/vmware-view.desktop"
	for f in usr/bin/*; do dobin "${f}"; done
	dolib_r "usr/lib"

}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
