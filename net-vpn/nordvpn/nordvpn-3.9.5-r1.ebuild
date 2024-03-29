# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit rpm systemd tmpfiles

FETCH_P=${P#-bin}-${PR#r}
SRC_URI="https://repo.nordvpn.com/yum/nordvpn/centos/x86_64/Packages/n/${FETCH_P}.x86_64.rpm"
DESCRIPTION="NordVPN Linux Client"
HOMEPAGE="https://nordvpn.com/ru/download/linux/"

LICENSE="GPL-2 public-domain"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror"
IUSE="wireguard"

DEPEND="app-arch/rpm
	app-arch/cpio"
RDEPEND="acct-group/nordvpn
	net-firewall/iptables
	sys-apps/iproute2
	app-misc/ca-certificates
	sys-process/procps
	dev-libs/libxml2
	dev-libs/icu
	net-vpn/openvpn  
	wireguard? ( virtual/wireguard )"



S=${WORKDIR}
QA_PREBUILT="/usr/sbin/nordvpnd 
	/usr/bin/nordvpn"

src_unpack () {
    rpm2cpio ${DISTDIR}/${A} | cpio -idm --no-absolute-filenames
    # rpm_src_unpack ${A}
}


src_install () {




	# get rid of packaged openvpn binary
	rm var/lib/${PN}/openvpn

	
	dobin usr/bin/${PN}
	dosbin usr/sbin/${PN}d
	systemd_dounit  usr/lib/systemd/system/nordvpnd.service
	systemd_dounit  usr/lib/systemd/system/nordvpnd.socket
	doman usr/share/man/man1/nordvpn.1.gz
	insinto usr/share
	doins -r usr/share/bash-completion
	doins -r usr/share/zsh
	insinto var/lib
	doins -r var/lib/${PN}
	dotmpfiles usr/lib/tmpfiles.d/nordvpn.conf
	dosym /usr/sbin/openvpn var/lib/${PN}/openvpn  
	
}

pkg_postinst() {
        tmpfiles_process nordvpn.conf
        elog "the user musr be added to nordvpn group to allow usage of NordVPN client"
}

