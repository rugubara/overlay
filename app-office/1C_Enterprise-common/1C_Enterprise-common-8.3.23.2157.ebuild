# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

inherit rpm  
#inherit eutils pax-utils rpm 


DESCRIPTION="Native linux client of 1C ERP system"
HOMEPAGE="http://v8.1c.ru/"

MY_PV="$(ver_rs 3 '-' )"
MY_PN="1c-enterprise"

SRC_URI="amd64? ( ${MY_PN}-${PV}-common-${MY_PV}.x86_64.rpm )
		"

SLOT=$(ver_cut 1-2)
LICENSE="1CEnterprise_en"
KEYWORDS="amd64"
RESTRICT="fetch strip"

#IUSE="+nls"
#	~app-office/1C_Enterprise-common-${PV}:${SLOT}
#	~app-office/1C_Enterprise-server-${PV}:${SLOT}

RDEPEND="gui-libs/gtk
	app-text/enchant
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

S="${WORKDIR}"

src_install() {
	dodir /opt /usr
	dodir /usr/share
}
