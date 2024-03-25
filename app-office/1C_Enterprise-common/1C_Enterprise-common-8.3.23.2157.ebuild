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



RDEPEND=""

DEPEND="${RDEPEND}
	app-arch/rpm"

#S="${WORKDIR}"

src_unpack() {
	mkdir ${WORKDIR}/${P}
	cd ${WORKDIR}/${P}
	rpm_unpack ${A}
}

src_install() {
	doins -r opt
}
