# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-block/disktype/disktype-9.ebuild,v 1.12 2011/09/28 00:52:19 radhermit Exp $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="Detect the content format of a disk or disk image."
HOMEPAGE="http://disktype.sourceforge.net/"
SRC_URI="mirror://sourceforge/disktype/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm ppc sh sparc x86"
IUSE=""

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

src_install() {
	dobin disktype
	dodoc README HISTORY TODO
	doman disktype.1
}
