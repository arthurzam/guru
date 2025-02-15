# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 pypy3 )

inherit distutils-r1

DESCRIPTION="httptools is a Python binding for the nodejs HTTP parser"
HOMEPAGE="
	https://github.com/MagicStack/httptools
	https://pypi.org/project/httptools/
"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="dev-python/cython[${PYTHON_USEDEP}]"
