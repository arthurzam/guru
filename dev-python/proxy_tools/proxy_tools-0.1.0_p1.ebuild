# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

MY_COMMIT="db43f1e35d4f90a65c5a4d56d9e9af88212ec6e6"

DESCRIPTION="Simple proxy (as in the GoF design pattern)"
HOMEPAGE="https://pypi.org/project/proxy_tools/"
# pypi tarballs are missing test data
SRC_URI="https://github.com/jtushman/${PN}/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}"/${PN}-${MY_COMMIT}

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests nose
