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
	EGO_SUM=(
	"cloud.google.com/go v0.26.0/go.mod"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/DATA-DOG/go-sqlmock v1.3.3"
	"github.com/DATA-DOG/go-sqlmock v1.3.3/go.mod"
	"github.com/OpenPeeDeeP/depguard v0.0.0-20180806142446-a69c782687b2/go.mod"
	"github.com/OpenPeeDeeP/depguard v0.0.0-20181229194401-1f388ab2d810/go.mod"
	"github.com/StackExchange/wmi v0.0.0-20180116203802-5d049714c4a6/go.mod"
	"github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc/go.mod"
	"github.com/alecthomas/template v0.0.0-20190718012654-fb15b899a751/go.mod"
	"github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf/go.mod"
	"github.com/alecthomas/units v0.0.0-20190717042225-c3de453c63f4/go.mod"
	"github.com/alvaroloes/enumer v1.1.1/go.mod"
	"github.com/armon/consul-api v0.0.0-20180202201655-eb2c6b5be1b6/go.mod"
	"github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973"
	"github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973/go.mod"
	"github.com/beorn7/perks v1.0.0/go.mod"
	"github.com/beorn7/perks v1.0.1"
	"github.com/beorn7/perks v1.0.1/go.mod"
	"github.com/cespare/xxhash/v2 v2.1.0"
	"github.com/cespare/xxhash/v2 v2.1.0/go.mod"
	"github.com/client9/misspell v0.3.4/go.mod"
	"github.com/coreos/etcd v3.3.10+incompatible/go.mod"
	"github.com/coreos/go-etcd v2.0.0+incompatible/go.mod"
	"github.com/coreos/go-semver v0.2.0/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/fatih/color v1.6.0/go.mod"
	"github.com/fatih/color v1.7.0"
	"github.com/fatih/color v1.7.0/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/ftrvxmtrx/fd v0.0.0-20150925145434-c6d800382fff"
	"github.com/ftrvxmtrx/fd v0.0.0-20150925145434-c6d800382fff/go.mod"
	"github.com/gdamore/encoding v1.0.0"
	"github.com/gdamore/encoding v1.0.0/go.mod"
	"github.com/gdamore/tcell v1.2.0"
	"github.com/gdamore/tcell v1.2.0/go.mod"
	"github.com/go-critic/go-critic v0.3.4/go.mod"
	"github.com/go-critic/go-critic v0.3.5-0.20190526074819-1df300866540/go.mod"
	"github.com/go-kit/kit v0.8.0/go.mod"
	"github.com/go-kit/kit v0.9.0/go.mod"
	"github.com/go-lintpack/lintpack v0.5.1/go.mod"
	"github.com/go-lintpack/lintpack v0.5.2/go.mod"
	"github.com/go-logfmt/logfmt v0.3.0"
	"github.com/go-logfmt/logfmt v0.3.0/go.mod"
	"github.com/go-logfmt/logfmt v0.4.0"
	"github.com/go-logfmt/logfmt v0.4.0/go.mod"
	"github.com/go-ole/go-ole v1.2.1/go.mod"
	"github.com/go-sql-driver/mysql v1.4.1-0.20190907122137-b2c03bcae3d4"
	"github.com/go-sql-driver/mysql v1.4.1-0.20190907122137-b2c03bcae3d4/go.mod"
	"github.com/go-stack/stack v1.8.0/go.mod"
	"github.com/go-toolsmith/astcast v0.0.0-20181028201508-b7a89ed70af1/go.mod"
	"github.com/go-toolsmith/astcast v1.0.0/go.mod"
	"github.com/go-toolsmith/astcopy v0.0.0-20180903214859-79b422d080c4/go.mod"
	"github.com/go-toolsmith/astcopy v1.0.0/go.mod"
	"github.com/go-toolsmith/astequal v0.0.0-20180903214952-dcb477bfacd6/go.mod"
	"github.com/go-toolsmith/astequal v1.0.0/go.mod"
	"github.com/go-toolsmith/astfmt v0.0.0-20180903215011-8f8ee99c3086/go.mod"
	"github.com/go-toolsmith/astfmt v1.0.0/go.mod"
	"github.com/go-toolsmith/astinfo v0.0.0-20180906194353-9809ff7efb21/go.mod"
	"github.com/go-toolsmith/astp v0.0.0-20180903215135-0af7e3c24f30/go.mod"
	"github.com/go-toolsmith/astp v1.0.0/go.mod"
	"github.com/go-toolsmith/pkgload v0.0.0-20181119091011-e9e65178eee8/go.mod"
	"github.com/go-toolsmith/pkgload v1.0.0/go.mod"
	"github.com/go-toolsmith/strparse v0.0.0-20180903215201-830b6daa1241/go.mod"
	"github.com/go-toolsmith/strparse v1.0.0/go.mod"
	"github.com/go-toolsmith/typep v0.0.0-20181030061450-d63dc7650676/go.mod"
	"github.com/go-toolsmith/typep v1.0.0/go.mod"
	"github.com/gobwas/glob v0.2.3/go.mod"
	"github.com/gogo/protobuf v1.1.1/go.mod"
	"github.com/gogo/protobuf v1.2.1/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/lint v0.0.0-20180702182130-06c8688daad7/go.mod"
	"github.com/golang/mock v1.0.0/go.mod"
	"github.com/golang/mock v1.1.1/go.mod"
	"github.com/golang/mock v1.2.0/go.mod"
	"github.com/golang/protobuf v1.2.0"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.3.2"
	"github.com/golang/protobuf v1.3.2/go.mod"
	"github.com/golangci/check v0.0.0-20180506172741-cfe4005ccda2/go.mod"
	"github.com/golangci/dupl v0.0.0-20180902072040-3e9179ac440a/go.mod"
	"github.com/golangci/errcheck v0.0.0-20181223084120-ef45e06d44b6/go.mod"
	"github.com/golangci/go-misc v0.0.0-20180628070357-927a3d87b613/go.mod"
	"github.com/golangci/go-tools v0.0.0-20190124090046-35a9f45a5db0/go.mod"
	"github.com/golangci/go-tools v0.0.0-20190318060251-af6baa5dc196/go.mod"
	"github.com/golangci/goconst v0.0.0-20180610141641-041c5f2b40f3/go.mod"
	"github.com/golangci/gocyclo v0.0.0-20180528134321-2becd97e67ee/go.mod"
	"github.com/golangci/gocyclo v0.0.0-20180528144436-0a533e8fa43d/go.mod"
	"github.com/golangci/gofmt v0.0.0-20181222123516-0b8337e80d98/go.mod"
	"github.com/golangci/golangci-lint v1.17.1/go.mod"
	"github.com/golangci/gosec v0.0.0-20180901114220-8afd9cbb6cfb/go.mod"
	"github.com/golangci/gosec v0.0.0-20190211064107-66fb7fc33547/go.mod"
	"github.com/golangci/ineffassign v0.0.0-20190609212857-42439a7714cc/go.mod"
	"github.com/golangci/lint-1 v0.0.0-20181222135242-d2cdd8c08219/go.mod"
	"github.com/golangci/lint-1 v0.0.0-20190420132249-ee948d087217/go.mod"
	"github.com/golangci/maligned v0.0.0-20180506175553-b1d89398deca/go.mod"
	"github.com/golangci/misspell v0.0.0-20180809174111-950f5d19e770/go.mod"
	"github.com/golangci/misspell v0.3.4/go.mod"
	"github.com/golangci/prealloc v0.0.0-20180630174525-215b22d4de21/go.mod"
	"github.com/golangci/revgrep v0.0.0-20180526074752-d9c87f5ffaf0/go.mod"
	"github.com/golangci/revgrep v0.0.0-20180812185044-276a5c0a1039/go.mod"
	"github.com/golangci/unconvert v0.0.0-20180507085042-28b1c447d1f4/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-cmp v0.3.0"
	"github.com/google/go-cmp v0.3.0/go.mod"
	"github.com/google/gofuzz v1.0.0/go.mod"
	"github.com/google/uuid v1.1.1"
	"github.com/google/uuid v1.1.1/go.mod"
	"github.com/gostaticanalysis/analysisutil v0.0.0-20190318220348-4088753ea4d3/go.mod"
	"github.com/hashicorp/hcl v0.0.0-20180404174102-ef8a98b0bbce/go.mod"
	"github.com/hashicorp/hcl v1.0.0/go.mod"
	"github.com/hpcloud/tail v1.0.0"
	"github.com/hpcloud/tail v1.0.0/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.0"
	"github.com/inconshreveable/mousetrap v1.0.0/go.mod"
	"github.com/jinzhu/copier v0.0.0-20170922082739-db4671f3a9b8"
	"github.com/jinzhu/copier v0.0.0-20170922082739-db4671f3a9b8/go.mod"
	"github.com/json-iterator/go v1.1.6/go.mod"
	"github.com/json-iterator/go v1.1.7/go.mod"
	"github.com/julienschmidt/httprouter v1.2.0/go.mod"
	"github.com/k0kubun/colorstring v0.0.0-20150214042306-9440f1994b88"
	"github.com/k0kubun/colorstring v0.0.0-20150214042306-9440f1994b88/go.mod"
	"github.com/kisielk/errcheck v1.1.0/go.mod"
	"github.com/kisielk/gotool v0.0.0-20161130080628-0de1eaf82fa3/go.mod"
	"github.com/kisielk/gotool v1.0.0"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/klauspost/compress v1.4.0/go.mod"
	"github.com/klauspost/compress v1.4.1/go.mod"
	"github.com/klauspost/cpuid v0.0.0-20180405133222-e7e905edc00e/go.mod"
	"github.com/klauspost/cpuid v1.2.0/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.2/go.mod"
	"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515"
	"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/lib/pq v1.2.0"
	"github.com/lib/pq v1.2.0/go.mod"
	"github.com/logrusorgru/aurora v0.0.0-20181002194514-a7b3b318ed4e/go.mod"
	"github.com/lucasb-eyer/go-colorful v1.0.2"
	"github.com/lucasb-eyer/go-colorful v1.0.2/go.mod"
	"github.com/magiconair/properties v1.7.6/go.mod"
	"github.com/magiconair/properties v1.8.0/go.mod"
	"github.com/mattn/go-colorable v0.0.9"
	"github.com/mattn/go-colorable v0.0.9/go.mod"
	"github.com/mattn/go-colorable v0.1.4"
	"github.com/mattn/go-colorable v0.1.4/go.mod"
	"github.com/mattn/go-isatty v0.0.3"
	"github.com/mattn/go-isatty v0.0.3/go.mod"
	"github.com/mattn/go-isatty v0.0.8"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-runewidth v0.0.4"
	"github.com/mattn/go-runewidth v0.0.4/go.mod"
	"github.com/mattn/goveralls v0.0.2/go.mod"
	"github.com/matttproud/golang_protobuf_extensions v1.0.0/go.mod"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod"
	"github.com/mitchellh/go-homedir v1.0.0/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/mitchellh/go-ps v0.0.0-20170309133038-4fdf99ab2936/go.mod"
	"github.com/mitchellh/mapstructure v0.0.0-20180220230111-00c29f56e238/go.mod"
	"github.com/mitchellh/mapstructure v1.1.2/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742/go.mod"
	"github.com/modern-go/reflect2 v1.0.1/go.mod"
	"github.com/montanaflynn/stats v0.5.0"
	"github.com/montanaflynn/stats v0.5.0/go.mod"
	"github.com/mozilla/tls-observatory v0.0.0-20180409132520-8791a200eb40/go.mod"
	"github.com/mwitkow/go-conntrack v0.0.0-20161129095857-cc309e4a2223/go.mod"
	"github.com/nbutton23/zxcvbn-go v0.0.0-20160627004424-a22cb81b2ecd/go.mod"
	"github.com/nbutton23/zxcvbn-go v0.0.0-20171102151520-eafdab6b0663/go.mod"
	"github.com/onsi/ginkgo v0.0.0-20170829012221-11459a886d9c/go.mod"
	"github.com/onsi/ginkgo v1.6.0"
	"github.com/onsi/ginkgo v1.6.0/go.mod"
	"github.com/onsi/ginkgo v1.10.2"
	"github.com/onsi/ginkgo v1.10.2/go.mod"
	"github.com/onsi/gomega v0.0.0-20170829124025-dcabb60a477c/go.mod"
	"github.com/onsi/gomega v1.4.2"
	"github.com/onsi/gomega v1.4.2/go.mod"
	"github.com/onsi/gomega v1.7.0"
	"github.com/onsi/gomega v1.7.0/go.mod"
	"github.com/pascaldekloe/name v0.0.0-20180628100202-0fd16699aae1/go.mod"
	"github.com/pelletier/go-toml v1.1.0/go.mod"
	"github.com/pelletier/go-toml v1.2.0/go.mod"
	"github.com/pkg/errors v0.8.0"
	"github.com/pkg/errors v0.8.0/go.mod"
	"github.com/pkg/errors v0.8.1"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pkg/profile v1.2.1"
	"github.com/pkg/profile v1.2.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/problame/go-netssh v0.0.0-20190110232351-09d6bc45d284"
	"github.com/problame/go-netssh v0.0.0-20190110232351-09d6bc45d284/go.mod"
	"github.com/problame/go-netssh v0.0.0-20191026123024-f34099f4f6b1"
	"github.com/problame/go-netssh v0.0.0-20191026123024-f34099f4f6b1/go.mod"
	"github.com/prometheus/client_golang v0.0.0-20180410130117-e11c6ff8170b/go.mod"
	"github.com/prometheus/client_golang v0.9.1/go.mod"
	"github.com/prometheus/client_golang v1.0.0/go.mod"
	"github.com/prometheus/client_golang v1.2.1"
	"github.com/prometheus/client_golang v1.2.1/go.mod"
	"github.com/prometheus/client_model v0.0.0-20171117100541-99fa1f4be8e5/go.mod"
	"github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190812154241-14fe0d1b01d4"
	"github.com/prometheus/client_model v0.0.0-20190812154241-14fe0d1b01d4/go.mod"
	"github.com/prometheus/common v0.0.0-20180413074202-d0f7cd64bda4/go.mod"
	"github.com/prometheus/common v0.4.1/go.mod"
	"github.com/prometheus/common v0.7.0"
	"github.com/prometheus/common v0.7.0/go.mod"
	"github.com/prometheus/procfs v0.0.0-20180408092902-8b1c2da0d56d/go.mod"
	"github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d/go.mod"
	"github.com/prometheus/procfs v0.0.2/go.mod"
	"github.com/prometheus/procfs v0.0.5"
	"github.com/prometheus/procfs v0.0.5/go.mod"
	"github.com/quasilyte/go-consistent v0.0.0-20190521200055-c6f3937de18c/go.mod"
	"github.com/rogpeppe/go-internal v1.1.0/go.mod"
	"github.com/rogpeppe/go-internal v1.2.1/go.mod"
	"github.com/ryanuber/go-glob v0.0.0-20170128012129-256dc444b735/go.mod"
	"github.com/sergi/go-diff v1.0.0"
	"github.com/sergi/go-diff v1.0.0/go.mod"
	"github.com/sergi/go-diff v1.0.1-0.20180205163309-da645544ed44"
	"github.com/sergi/go-diff v1.0.1-0.20180205163309-da645544ed44/go.mod"
	"github.com/shirou/gopsutil v0.0.0-20180427012116-c95755e4bcd7/go.mod"
	"github.com/shirou/w32 v0.0.0-20160930032740-bb4de0191aa4/go.mod"
	"github.com/shurcooL/go v0.0.0-20180423040247-9e1955d9fb6e/go.mod"
	"github.com/shurcooL/go-goon v0.0.0-20170922171312-37c2f522c041/go.mod"
	"github.com/sirupsen/logrus v1.0.5/go.mod"
	"github.com/sirupsen/logrus v1.2.0/go.mod"
	"github.com/sirupsen/logrus v1.4.0/go.mod"
	"github.com/sirupsen/logrus v1.4.2/go.mod"
	"github.com/sourcegraph/go-diff v0.5.1/go.mod"
	"github.com/spf13/afero v1.1.0/go.mod"
	"github.com/spf13/afero v1.1.2/go.mod"
	"github.com/spf13/afero v1.2.2/go.mod"
	"github.com/spf13/cast v1.2.0/go.mod"
	"github.com/spf13/cast v1.3.0/go.mod"
	"github.com/spf13/cobra v0.0.2"
	"github.com/spf13/cobra v0.0.2/go.mod"
	"github.com/spf13/jwalterweatherman v0.0.0-20180109140146-7c0cea34c8ec/go.mod"
	"github.com/spf13/jwalterweatherman v1.0.0/go.mod"
	"github.com/spf13/jwalterweatherman v1.1.0/go.mod"
	"github.com/spf13/pflag v1.0.1/go.mod"
	"github.com/spf13/pflag v1.0.3"
	"github.com/spf13/pflag v1.0.3/go.mod"
	"github.com/spf13/viper v1.0.2/go.mod"
	"github.com/spf13/viper v1.3.2/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.1.1/go.mod"
	"github.com/stretchr/testify v1.2.2"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/theckman/goconstraint v1.11.0"
	"github.com/theckman/goconstraint v1.11.0/go.mod"
	"github.com/timakin/bodyclose v0.0.0-20190407043127-4a873e97b2bb/go.mod"
	"github.com/ugorji/go/codec v0.0.0-20181204163529-d75b2dcb6bc8/go.mod"
	"github.com/valyala/bytebufferpool v1.0.0/go.mod"
	"github.com/valyala/fasthttp v1.2.0/go.mod"
	"github.com/valyala/quicktemplate v1.1.1/go.mod"
	"github.com/valyala/tcplisten v0.0.0-20161114210144-ceec8f93295a/go.mod"
	"github.com/xordataexchange/crypt v0.0.3-0.20170626215501-b2862e3d0a77/go.mod"
	"github.com/yudai/gojsondiff v0.0.0-20170107030110-7b1b7adf999d"
	"github.com/yudai/gojsondiff v0.0.0-20170107030110-7b1b7adf999d/go.mod"
	"github.com/yudai/golcs v0.0.0-20170316035057-ecda9a501e82"
	"github.com/yudai/golcs v0.0.0-20170316035057-ecda9a501e82/go.mod"
	"github.com/yudai/pp v2.0.1+incompatible"
	"github.com/yudai/pp v2.0.1+incompatible/go.mod"
	"github.com/zrepl/yaml-config v0.0.0-20190928121844-af7ca3f8448f"
	"github.com/zrepl/yaml-config v0.0.0-20190928121844-af7ca3f8448f/go.mod"
	"github.com/zrepl/zrepl v0.2.0/go.mod"
	"golang.org/x/crypto v0.0.0-20180904163835-0709b304e793/go.mod"
	"golang.org/x/crypto v0.0.0-20181203042331-505ab145d0a9/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190313024323-a1f597ede03a/go.mod"
	"golang.org/x/crypto v0.0.0-20190325154230-a5d413f7728c/go.mod"
	"golang.org/x/lint v0.0.0-20180702182130-06c8688daad7/go.mod"
	"golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3/go.mod"
	"golang.org/x/net v0.0.0-20170915142106-8351a756f30f/go.mod"
	"golang.org/x/net v0.0.0-20180826012351-8a410e7b638d/go.mod"
	"golang.org/x/net v0.0.0-20180906233101-161cd47e91fd/go.mod"
	"golang.org/x/net v0.0.0-20180911220305-26e67e76b6c3/go.mod"
	"golang.org/x/net v0.0.0-20181106065722-10aee1819953/go.mod"
	"golang.org/x/net v0.0.0-20181114220301-adae6a3d119a/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190313220215-9f648a60d977/go.mod"
	"golang.org/x/net v0.0.0-20190613194153-d28f0bde5980"
	"golang.org/x/net v0.0.0-20190613194153-d28f0bde5980/go.mod"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sys v0.0.0-20171026204733-164713f0dfce/go.mod"
	"golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod"
	"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod"
	"golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e/go.mod"
	"golang.org/x/sys v0.0.0-20181116152217-5ac8a444bdc5/go.mod"
	"golang.org/x/sys v0.0.0-20181205085412-a5c9d58dba9a/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20190312061237-fead79001313/go.mod"
	"golang.org/x/sys v0.0.0-20190422165155-953cdadca894/go.mod"
	"golang.org/x/sys v0.0.0-20190626150813-e07cf5db2756"
	"golang.org/x/sys v0.0.0-20190626150813-e07cf5db2756/go.mod"
	"golang.org/x/sys v0.0.0-20191010194322-b09406accb47"
	"golang.org/x/sys v0.0.0-20191010194322-b09406accb47/go.mod"
	"golang.org/x/text v0.0.0-20170915090833-1cbadb444a80/go.mod"
	"golang.org/x/text v0.3.0"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/tools v0.0.0-20170915040203-e531a2a1c15f/go.mod"
	"golang.org/x/tools v0.0.0-20180221164845-07fd8470d635/go.mod"
	"golang.org/x/tools v0.0.0-20180828015842-6cd1fcedba52/go.mod"
	"golang.org/x/tools v0.0.0-20181117154741-2ddaf7f79a09/go.mod"
	"golang.org/x/tools v0.0.0-20181205014116-22934f0fdb62/go.mod"
	"golang.org/x/tools v0.0.0-20190110163146-51295c7ec13a/go.mod"
	"golang.org/x/tools v0.0.0-20190121143147-24cd39ecf745/go.mod"
	"golang.org/x/tools v0.0.0-20190213192042-740235f6c0d8/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190311215038-5c2858a9cfe5/go.mod"
	"golang.org/x/tools v0.0.0-20190322203728-c1a832b0ad89/go.mod"
	"golang.org/x/tools v0.0.0-20190521203540-521d6ed310dd/go.mod"
	"golang.org/x/tools v0.0.0-20190524210228-3d17549cdc6b/go.mod"
	"google.golang.org/appengine v1.1.0"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod"
	"google.golang.org/genproto v0.0.0-20181202183823-bd91e49a0898"
	"google.golang.org/genproto v0.0.0-20181202183823-bd91e49a0898/go.mod"
	"google.golang.org/grpc v1.16.0/go.mod"
	"google.golang.org/grpc v1.17.0"
	"google.golang.org/grpc v1.17.0/go.mod"
	"gopkg.in/airbrake/gobrake.v2 v2.0.9/go.mod"
	"gopkg.in/alecthomas/kingpin.v2 v2.2.6/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/fsnotify.v1 v1.4.7"
	"gopkg.in/fsnotify.v1 v1.4.7/go.mod"
	"gopkg.in/gemnasium/logrus-airbrake-hook.v2 v2.1.2/go.mod"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod"
	"gopkg.in/yaml.v2 v2.0.0-20170812160011-eb3733d160e7/go.mod"
	"gopkg.in/yaml.v2 v2.2.1/go.mod"
	"gopkg.in/yaml.v2 v2.2.2"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"honnef.co/go/tools v0.0.0-20180728063816-88497007e858/go.mod"
	"mvdan.cc/interfacer v0.0.0-20180901003855-c20040233aed/go.mod"
	"mvdan.cc/lint v0.0.0-20170908181259-adc824a0674b/go.mod"
	"mvdan.cc/unparam v0.0.0-20190209190245-fbb59629db34/go.mod"
	"mvdan.cc/unparam v0.0.0-20190310220240-1b9ccfa71afe/go.mod"
	"sourcegraph.com/sqs/pbtypes v0.0.0-20180604144634-d3ebe8f20ae4/go.mod"
	"sourcegraph.com/sqs/pbtypes v1.0.0/go.mod"
	)
	go-module_set_globals

	SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		${EGO_SUM_SRC_URI}"
	KEYWORDS="~amd64 ~ppc64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="pie"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	if [[ ${PV} == *9999* ]]; then
		git-r3_src_unpack
		go-module_live_vendor
	else
		go-module_src_unpack
	fi
}

src_configure() {
	[[ ${PV} == *9999* ]] || export ZREPL_VERSION="${PV}"
	export GO_EXTRA_BUILDFLAGS="-buildmode=$(usex pie pie default) -extldflags ${LDFLAGS}"
}

src_compile() {
	emake zrepl-bin
	artifacts/zrepl* bashcomp "${T}/bashcomp"
}

src_install() {
	newbin artifacts/zrepl* zrepl
	systemd_dounit dist/systemd/zrepl.service
	newbashcomp "${T}/bashcomp" zrepl
	einstalldocs
	docinto examples
	dodoc -r config/samples/. dist/grafana/grafana-prometheus-zrepl-*.json
}