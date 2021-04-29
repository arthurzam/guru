# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg

DESCRIPTION="Blackvoxel Video Game"
HOMEPAGE="https://www.blackvoxel.com/"
SRC_URI="https://www.blackvoxel.com/dm_download.php?file=163&key=1 -> ${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-libs/expat
	media-libs/alsa-lib
	media-libs/glew:0
	media-libs/libsdl
	x11-libs/libX11
	virtual/opengl
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}_source_${PV//./_}"

PATCHES=(
	"${FILESDIR}"/${P}-makefile.patch
	"${FILESDIR}"/${P}-savedir.patch
)

src_compile() {
	emake blackvoxeldatadir="/usr/share/${PN}" bindir="/usr/bin"
}

src_install() {
	dodoc Contributors.txt
	doman blackvoxel.6
	newicon -s 16 Icons/blackvoxel-16x16.png blackvoxel.png
	newicon -s 32 Icons/blackvoxel-32x32.png blackvoxel.png
	newicon -s 128 Icons/blackvoxel_128x128.png blackvoxel.png

	dobin blackvoxel
	insinto "/usr/share/${PN}"
	doins -r Misc Sound VoxelTypes gui randomnum.dat
}
