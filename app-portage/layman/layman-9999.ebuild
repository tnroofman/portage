# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-portage/layman/layman-9999.ebuild,v 1.31 2013/08/10 17:14:01 dolsen Exp $

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7} pypy2_0 )
PYTHON_REQ_USE="xml(+)"

inherit eutils distutils-r1 git-2 prefix

DESCRIPTION="Tool to manage Gentoo overlays"
HOMEPAGE="http://layman.sourceforge.net"
SRC_URI=""
EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/layman.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="bazaar cvs darcs +git gpg mercurial subversion test"

DEPEND="test? ( dev-vcs/subversion )
	app-text/asciidoc"

RDEPEND="
	bazaar? ( dev-vcs/bzr )
	cvs? ( dev-vcs/cvs )
	darcs? ( dev-vcs/darcs )
	git? ( dev-vcs/git )
	mercurial? ( dev-vcs/mercurial )
	subversion? (
		|| (
			>=dev-vcs/subversion-1.5.4[webdav-neon]
			>=dev-vcs/subversion-1.5.4[webdav-serf]
		)
	)
	gpg? ( =dev-python/pyGPG-9999 )
	virtual/python-argparse[${PYTHON_USEDEP}]
	>=dev-python/requests-1.2.1
	dev-python/ndg-httpsclient
	dev-python/pyasn1
	>=dev-python/pyopenssl-0.13
	"

python_prepare_all()  {
	distutils-r1_python_prepare_all
	eprefixify etc/layman.cfg layman/config.py
}

python_test() {
	for suite in layman/tests/{dtest,external}.py ; do
		PYTHONPATH="." "${PYTHON}" ${suite} \
				|| die "test suite '${suite}' failed"
	done
}

python_compile_all() {
	# override MAKEOPTS to prevent build failure
	emake -j1 -C doc
}

python_install_all() {
	distutils-r1_python_install_all

	insinto /etc/layman
	doins etc/layman.cfg

	doman doc/layman.8
	dohtml doc/layman.8.html

	keepdir /var/lib/layman
	keepdir /etc/layman/overlays
}

pkg_postinst() {
	# now run layman's update utility
	einfo "Running layman-updater..."
	"${EROOT}"/usr/bin/layman-updater
	einfo
}