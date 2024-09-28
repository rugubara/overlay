# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

inherit rpm desktop 
#inherit eutils pax-utils rpm 


DESCRIPTION="Native linux server of 1C ERP system"
HOMEPAGE="http://v8.1c.ru/"

MY_PV="$(ver_rs 3 '-' )"
MY_PN="1c-enterprise"

SRC_URI="amd64? ( ${MY_PN}-${PV}-server-${MY_PV}.x86_64.rpm
		nls? ( ${MY_PN}-${PV}-server-nls-${MY_PV}.x86_64.rpm ) )
		"

SLOT=$(ver_cut 1-2)
LICENSE="1CEnterprise_en"
KEYWORDS="amd64"
RESTRICT="fetch strip"

IUSE="+nls"
#	~app-office/1C_Enterprise-common-${PV}:${SLOT}
#	~app-office/1C_Enterprise-server-${PV}:${SLOT}

PATCHES=(
	"${FILESDIR}"/systemd-service-homdedir.patch # update the server workdir to /var/lib/usr1cv8
)


RDEPEND="=app-office/1C_Enterprise-common-${PV}:${SLOT}
	"

DEPEND="${RDEPEND}
	acct-group/grp1cv8
	acct-user/usr1cv8"

#S="${WORKDIR}"

src_unpack() {
	mkdir ${WORKDIR}/${P}
	cd ${WORKDIR}/${P}
	rpm_unpack ${A}
}


src_install() {
	doins -r opt
	exeinto /opt/1cv8/x86_64/${PV}
	for i in `find ${WORKDIR}/${P}/opt/1cv8/x86_64/${PV} -executable \! -type d \! -name '*.*' -print`
		do doexe $i 
	done
	insinto /var/1C/licenses
	touch .keep
	doins .keep
	fowners -R usr1cv8:grp1cv8 /var/1C

}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
