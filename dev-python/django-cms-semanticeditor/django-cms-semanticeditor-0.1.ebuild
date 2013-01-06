# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils distutils mercurial

DESCRIPTION="Semantic Editor is a Django CMS plugin for text editing."
HOMEPAGE="https://bitbucket.org/spookylukey/semanticeditor/overview"

EHG_REPO_URI="https://bitbucket.org/spookylukey/semanticeditor"
EHG_REVISION="b30fe33d3f05"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND=">=dev-python/django-1.3
"
DEPEND="dev-python/setuptools"

PYTHON_MODNAME="semanticeditor"

src_test() {
	python setup.py test || die "tests failed"
}

