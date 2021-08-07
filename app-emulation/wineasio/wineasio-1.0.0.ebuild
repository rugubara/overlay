# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit multilib-minimal

DESCRIPTION="ASIO driver for WINE"
HOMEPAGE="https://github.com/wineasio/wineasio"
SRC_URI="https://github.com/wineasio/${PN}/releases/download/v${PV}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
PATCHES=( 
	"${FILESDIR}/00-fakedll.patch" 
)
LICENSE="GPL-2"
IUSE=""
SLOT="0"

DEPEND="virtual/wine"
RDEPEND="virtual/jack[${MULTILIB_USEDEP}]"

#S="${WORKDIR}/${PN}"

pkg_setup() {
	export WINETARGET=`eselect --brief --colour=no wine show | awk '{$1=$1;print}'`
	[[ $WINETARGET == "(unset)" ]] && die "please set wine version (eselect wine)"
}

src_prepare() {
	default
	multilib_copy_sources
}

multilib_src_compile() {
	emake ${MULTILIB_ABI_FLAG: -2}
	
}

multilib_src_install() {
	exeinto /usr/$(get_libdir)/${WINETARGET}/wine/${MULTILIB_ABI_FLAG: 4}-unix
	doexe build${MULTILIB_ABI_FLAG: -2}/*.so
	exeinto /usr/$(get_libdir)/${WINETARGET}/wine/fakedlls
	doexe build${MULTILIB_ABI_FLAG: -2}/*.dll
}

pkg_postinst() {
	echo
	elog "Finally the dll must be registered in the wineprefix."
	elog "For both 32 and 64 bit wine do:"
	elog "# regsvr32 wineasio.dll"
	elog
	elog "On a 64 bit system with wine supporting both 32 and 64 applications, regsrv32"
	elog "will register the 32 bit driver in a 64 bit prefix, use the following command"
	elog "to register the 64 bit driver in a 64 bit wineprefix:"
	elog
	elog "# wine64 regsvr32 wineasio.dll"
	elog
	elog "regsvr32 registers the ASIO COM object in the default prefix "~/.wine"."
	elog "To use another prefix specify it explicitly, like:"
	elog "# env WINEPREFIX=~/asioapp regsvr32 wineasio.dll"
	echo
}

