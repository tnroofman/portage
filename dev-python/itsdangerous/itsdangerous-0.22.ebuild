# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/itsdangerous/itsdangerous-0.22.ebuild,v 1.2 2013/09/05 18:46:11 mgorny Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7,3_3} pypy2_0 )

inherit distutils-r1

DESCRIPTION="Various helpers to pass trusted data to untrusted environments and back."
HOMEPAGE="http://pythonhosted.org/itsdangerous/ http://pypi.python.org/pypi/itsdangerous"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
