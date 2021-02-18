# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="adds support for Windows vst's to be used in Linux vst capable DAW's."
HOMEPAGE="https://github.com/osxmidi/LinVst"
SRC_URI="https://github.com/osxmidi/LinVst/archive/${PV}.tar.gz -> ${PN}.tar.gz"
#https://github.com/osxmidi/LinVst/archive/3.2.1.zip

LICENSE="MIT"
SLOT="0/6"
KEYWORDS="~amd64 ~x86"
IUSE="+alsa doc jack pulseaudio"
REQUIRED_USE="|| ( alsa jack pulseaudio )"

RDEPEND="alsa? ( media-libs/alsa-lib )
	jack? (
		media-libs/alsa-lib
		virtual/jack
	)
	pulseaudio? ( media-sound/pulseaudio )"
DEPEND="${RDEPEND}"

src_compile () {
	emake EMBEDRESIZE=1 
	pushd convert
	emake
	emake -f Makefile-linconverttree
	popd
}

src_install () {
	emake DESTDIR="${D}" install
	pushd convert
	emake DESTDIR="${D}" -f Makefile-linconverttree install
	emake DESTDIR="${D}" install
	popd
	dobin vst/linvst.so
}
