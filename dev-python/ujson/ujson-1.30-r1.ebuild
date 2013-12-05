# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/ujson/ujson-1.30-r1.ebuild,v 1.1 2013/04/08 14:33:13 idella4 Exp $

EAPI="5"

# One test; FAIL: test_encodeToUTF8 (__main__.UltraJSONTests) under py2.5. 
# Fix and repair and re-insert if it's REALLY needed 
PYTHON_COMPAT=( python{2_6,2_7,3_2} )

inherit distutils-r1

DESCRIPTION="Ultra fast JSON encoder and decoder for Python"
HOMEPAGE="http://pypi.python.org/pypi/ujson/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	app-arch/unzip"
RDEPEND="${DEPEND}"

python_test() {
	# See setup.py; line 72. Again "${S}" is used for reading tests
	# Since py3_2 is first in the queue it needs its own copy 
	# or else all py2s to follow will be reading read py3 tests
	if [[ "${EPYTHON}" == 'python3.2' ]]; then
		cd "${BUILD_DIR}"/lib || die
		cp -a "${S}"/tests/ .  || die
		2to3 -w tests/tests.py
		"${PYTHON}" tests/tests.py || die
		rm -rf tests/ || die
	else
		"${PYTHON}" tests/tests.py || die
	fi
}