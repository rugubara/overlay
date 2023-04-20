# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module systemd

DESCRIPTION="One-stop, integrated solution for ZFS replication"
HOMEPAGE="https://zrepl.github.io"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/zrepl/zrepl.git"
else

	SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	
fi

LICENSE="MIT"
SLOT="0"
IUSE="pie"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


src_unpack () {
	unpack "${FILESDIR}/${P}-deps.tar.xz"
	go-module_src_unpack 
}

src_configure() {
	[[ ${PV} == *9999* ]] || export ZREPL_VERSION="${PV}"
	export ARTIFACTDIR="${S}/artifacts"
	export GO_EXTRA_BUILDFLAGS="-extldflags ${LDFLAGS}"
	
}

src_compile() {
	
	emake zrepl-bin
	${ARTIFACTDIR}/zrepl-${KERNEL}-${ARCH} gencompletion bash "${T}/bashcomp"
}

src_install() {
	newbin ${ARTIFACTDIR}/zrepl-${KERNEL}-${ARCH} zrepl
	systemd_dounit dist/systemd/zrepl.service
	newbashcomp "${T}/bashcomp" zrepl
#	einstalldocs
	docinto examples
	dodoc -r config/samples/. dist/grafana/grafana-prometheus-zrepl.json
}
