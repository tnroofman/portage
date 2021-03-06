# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/kaa-display/kaa-display-0.1.0-r1.ebuild,v 1.1 2013/07/02 01:51:50 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Python API providing Low level support for various displays, such as X11 or framebuffer."
HOMEPAGE="http://freevo.sourceforge.net/kaa/"
SRC_URI="mirror://sourceforge/freevo/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND=">=dev-python/kaa-base-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/kaa-imlib2-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/pygame-1.6.0[${PYTHON_USEDEP}]
	media-libs/imlib2[X]
	>=x11-libs/libX11-1.0.0"
RDEPEND="${DEPEND}"
DISTUTILS_IN_SOURCE_BUILD=1
