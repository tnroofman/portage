# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pywebdav/pywebdav-0.9.8-r1.ebuild,v 1.1 2013/10/10 16:31:38 mgorny Exp $

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7} pypy2_0 )

inherit distutils-r1

MY_P=${P/pywebdav/PyWebDAV}

DESCRIPTION="WebDAV server written in Python"
HOMEPAGE="http://code.google.com/p/pywebdav/ http://pypi.python.org/pypi/PyWebDAV"
SRC_URI="http://pywebdav.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

python_install_all() {
	distutils-r1_python_install_all
	dodoc doc/{ARCHITECTURE,Changes,TODO,interface_class,walker}
}