# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/ttystatus/ttystatus-0.22.ebuild,v 1.3 2013/03/24 11:49:22 mschiff Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Terminal progress bar and status output for command line"
HOMEPAGE="http://liw.fi/ttystatus/"
SRC_URI="http://code.liw.fi/debian/pool/main/p/python-${PN}/python-${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${PYTHON_DEPS}"
