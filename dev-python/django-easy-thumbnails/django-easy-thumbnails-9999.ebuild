# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils distutils git-2

DESCRIPTION="Easy thumbnails for Django"
HOMEPAGE="https://github.com/SmileyChris/easy-thumbnails.git"

EGIT_REPO_URI="https://github.com/SmileyChris/easy-thumbnails.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND=">=dev-python/django-1.3"
DEPEND="dev-python/setuptools"

PYTHON_MODNAME="easy_thumbnails"

S=${WORKDIR}/easy-thumbnails

src_test() {
	python setup.py test || die "tests failed"
}

