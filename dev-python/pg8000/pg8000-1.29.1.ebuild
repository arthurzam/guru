# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="A Pure-Python PostgreSQL Driver"
HOMEPAGE="
	https://github.com/tlocke/pg8000
	https://pypi.org/project/pg8000/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/scramp-1.4.1[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
BDEPEND="
	test? (
		dev-db/postgresql
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
	)
"

RESTRICT="test" # tests require a running postgresql

distutils_enable_tests pytest
