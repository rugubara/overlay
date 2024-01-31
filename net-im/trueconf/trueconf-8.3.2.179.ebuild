# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit rpm systemd tmpfiles

FETCH_P=${P#-bin}-${PR#r}
SRC_URI="https://trueconf.ru/download/client/linux/trueconf_client_fedora39_x86_64.rpm?v=${PV} -> ${P}.rpm"
DESCRIPTION="Trueconf IM solution"
HOMEPAGE="https://trueconf.ru"

LICENSE="GPL-2 public-domain"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror"
IUSE=""

DEPEND="app-arch/rpm
	app-arch/cpio"
RDEPEND="media-libs/alsa-lib
	media-sound/alsa-utils
	x11-base/xorg-server
	dev-libs/boost
	dev-libs/protobuf
	media-sound/pulseaudio
	dev-qt/qtwebengine:5
	media-libs/speex
	dev-db/sqlite
	sys-libs/zlib"



S=${WORKDIR}

src_unpack () {
    rpm2cpio ${DISTDIR}/${A} | cpio -idm --no-absolute-filenames
}




src_install () {





	
	insinto opt
	doins -r opt/${PN}
	insinto usr/share
	doins -r usr/share
#	insinto usr/local
#	doins -r usr/local
	fperms u-w,+x  /opt/${PN}/TrueConf

}


