# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="Krpano Tools License"
HOMEPAGE="http://krpano.com"
SRC_URI="http://krpano.com/krpano-license.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RESTRICT="fetch"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	insinto "/opt/krpanotools/license/"
	doins "${S}"/*
}
