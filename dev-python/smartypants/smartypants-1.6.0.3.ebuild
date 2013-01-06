# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils distutils

DESCRIPTION="SmartyPants is a free web publishing plug-in for Movable Type,
Blosxom, and BBEdit that easily translates plain ASCII punctuation characters
into “smart” typographic punctuation HTML entities."
HOMEPAGE="http://web.chad.org/projects/smartypants.py/"

SRC_URI="http://pypi.python.org/packages/source/s/smartypants/smartypants-1.6.0.3.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools"


