# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Reg.ru DNS authenticator plugin for Certbot"
HOMEPAGE="
	https://pypi.org/project/certbot-dns-regru/
"
# SRC_URI генерируется автоматически из pypi.eclass
SRC_URI="https://files.pythonhosted.org/packages/4e/ae/fcbe146b9faf34ae561986fce7fce66a90af32d7c62fe67727ff8d194aca/certbot_dns_regru-1.2.0.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# Плагин ставит entry-point "dns-regru"
RDEPEND="
	>=app-crypt/certbot-2.0.0
"

distutils_enable_tests pytest

