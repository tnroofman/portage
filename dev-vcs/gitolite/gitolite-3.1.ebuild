# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-vcs/gitolite/gitolite-3.1.ebuild,v 1.2 2013/04/05 06:17:31 radhermit Exp $

EAPI=4

inherit perl-module user versionator

DESCRIPTION="Highly flexible server for git directory version tracker"
HOMEPAGE="http://github.com/sitaramc/gitolite"
SRC_URI="http://milki.github.com/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="tools vim-syntax"

DEPEND="dev-lang/perl
	virtual/perl-File-Path
	virtual/perl-File-Temp
	>=dev-vcs/git-1.6.6"
RDEPEND="${DEPEND}
	!dev-vcs/gitolite-gentoo
	vim-syntax? ( app-vim/gitolite-syntax )"

pkg_setup() {
	enewgroup git
	enewuser git -1 /bin/sh /var/lib/gitolite git
}

src_prepare() {
	echo $PF > src/VERSION
}

src_install() {
	local uexec=/usr/libexec/${PN}

	rm -rf src/lib/Gitolite/Test{,.pm}
	insinto $VENDOR_LIB
	doins -r src/lib/Gitolite

	dodoc README.txt CHANGELOG

	insopts -m0755
	insinto $uexec
	doins -r src/{commands,syntactic-sugar,triggers,VREF}/

	insopts -m0644
	doins src/VERSION

	exeinto $uexec
	doexe src/gitolite{,-shell}

	dodir /usr/bin
	for bin in gitolite{,-shell}; do
		dosym /usr/libexec/${PN}/${bin} /usr/bin/${bin}
	done

	if use tools; then
		dobin check-g2-compat convert-gitosis-conf
	fi

	keepdir /var/lib/gitolite
	fowners git:git /var/lib/gitolite
	fperms 750 /var/lib/gitolite

	fperms 0644 ${uexec}/VREF/MERGE-CHECK # It's meant as example only
}

pkg_postinst() {
	if [ "$(get_major_version $REPLACING_VERSIONS)" = "2" ]; then
		ewarn
		elog "***NOTE** This is a major upgrade and will likely break your existing gitolite-2.x setup!"
		elog "Please read http://sitaramc.github.com/gitolite/install.html#migr first!"
	fi

	# bug 352291
	ewarn
	elog "Please make sure that your 'git' user has the correct homedir (/var/lib/gitolite)."
	elog "Especially if you're migrating from gitosis."
	ewarn
}
