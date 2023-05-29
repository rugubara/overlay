# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit  desktop

#FETCH_P=${P#-bin}-${PR#r}
SRC_URI="https://st.skbkontur.ru/content/talk-app/${PN}${PV}amd64.deb -> ${P}.deb"
DESCRIPTION="Ktalk net-im client"
HOMEPAGE="https://kontur.ru/talk"

LICENSE="EULA"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror"


RDEPEND="
	x11-libs/gtk+:3
	>=dev-libs/nss-3.0
	x11-misc/xdg-utils
	x11-libs/libXtst
	"



S=${WORKDIR}
QA_PREBUILT="/opt/Толк/resources/app.asar.unpacked/node_modules/wmi-client/bin/wmic_centos_x64"

src_unpack () {
    #rpm2cpio ${DISTDIR}/${A} | cpio -idm --no-absolute-filenames
    unpack ${A}
    unpack ${S}/data.tar.xz
}


src_install () {




	
	
	doins -r opt
	dosym "opt/Толк/ktalk" usr/bin/ktalk
	domenu usr/share/applications/ktalk.desktop
	for s in 16 32 48 64 128 256 512; 
		do doicon -s $s "usr/share/icons/hicolor/${s}x${s}/apps/ktalk.png";
	done
	
	
}



