# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/aqemu/aqemu-0.8.2-r2.ebuild,v 1.5 2013/03/02 19:24:21 hwoarang Exp $

EAPI=4

inherit  cmake-utils

DESCRIPTION="Graphical interface for QEMU and KVM emulators. Using Qt4."
HOMEPAGE="http://sourceforge.net/projects/aqemu"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="vnc"

DEPEND="${RDEPEND}"
RDEPEND="app-emulation/qemu
	vnc? ( net-libs/libvncserver )
	dev-qt/qtgui:4
	dev-qt/qttest:4
	dev-qt/qtxmlpatterns:4"

DOCS="AUTHORS CHANGELOG README TODO"
PATCHES=(
	"${FILESDIR}"/aqemu-0.8.2_sigsev_propertis.patch
	"${FILESDIR}"/aqemu-0.8.2_qt48_build.patch
	"${FILESDIR}"/aqemu-0.8.2_desktop_file.patch
)

src_configure() {
	local mycmakeargs=(
		"-DMAN_PAGE_COMPRESSOR="
		"-DWITHOUT_EMBEDDED_DISPLAY=$(use vnc && echo "OFF" || echo "ON")"
	)

	cmake-utils_src_configure
}
