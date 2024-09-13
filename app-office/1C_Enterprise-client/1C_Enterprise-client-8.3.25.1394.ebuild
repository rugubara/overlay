# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

inherit rpm desktop 
#inherit eutils pax-utils rpm 


DESCRIPTION="Native linux client of 1C ERP system"
HOMEPAGE="http://v8.1c.ru/"

MY_PV="$(ver_rs 3 '-' )"
MY_PN="1c-enterprise"

SRC_URI="amd64? ( ${MY_PN}-${PV}-client-${MY_PV}.x86_64.rpm
		nls? ( ${MY_PN}-${PV}-client-nls-${MY_PV}.x86_64.rpm ) )
		"

SLOT=$(ver_cut 1-2)
LICENSE="1CEnterprise_en"
KEYWORDS="amd64"
RESTRICT="fetch strip"

IUSE="+nls"
#	~app-office/1C_Enterprise-common-${PV}:${SLOT}
#	~app-office/1C_Enterprise-server-${PV}:${SLOT}

RDEPEND="=app-office/1C_Enterprise-common-${PV}:${SLOT}
	gui-libs/gtk
	app-text/enchant
	net-libs/libssh:0/4
	net-libs/webkit-gtk:4/37
	media-libs/harfbuzz[icu]
	media-libs/gstreamer
	media-plugins/gst-plugins-meta
	app-crypt/libsecret
	net-libs/libsoup
	dev-db/sqlite
	media-libs/libglvnd
	x11-libs/libXrender
	x11-libs/libXfixes
	dev-libs/libxslt
	app-misc/geoclue"

DEPEND="${RDEPEND}"

#S="${WORKDIR}"

src_unpack() {
	mkdir ${WORKDIR}/${P}
	cd ${WORKDIR}/${P}
	rpm_unpack ${A}
}

src_install() {
	doins -r opt
	exeinto /opt/1cv8/x86_64/${PV}
	for pr in opt/1cv8/x86_64/${PV}/{1cestart,1cv8,1cv8a,1cv8c,1cv8s} 
	do
		doexe ${pr}
	done
	for size in 16 36 22 32 72 128 96 512 256 192 24 48 64 
	do
		for icon in usr/share/icons/hicolor/${size}x${size}/apps/{1cestart,1cv8,1cv8c,1cv8s}-${MY_PV}.png
		do
			doicon -s ${size} ${icon}; 
		done
	done
	domenu usr/share/applications/{1cv8,1cv8c,1cv8s}-${MY_PV}.desktop

}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
