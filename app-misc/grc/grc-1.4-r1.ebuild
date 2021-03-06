# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/grc/grc-1.4-r1.ebuild,v 1.8 2013/11/22 08:09:14 jlec Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} pypy2_0 )

inherit eutils python-r1

DESCRIPTION="Generic Colouriser beautifies your logfiles or output of commands"
HOMEPAGE="http://kassiopeia.juls.savba.sk/~garabik/software/grc.html"
SRC_URI="http://kassiopeia.juls.savba.sk/~garabik/software/${PN}/${P/-/_}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-support-more-files.patch \
		"${FILESDIR}"/${P}-ipv6.patch
}

src_install() {
	python_foreach_impl python_doscript grc grcat

	insinto /usr/share/grc
	doins conf.* "${FILESDIR}"/conf.*

	insinto /etc
	doins grc.conf

	dodoc README INSTALL TODO CHANGES CREDITS
	doman grc.1 grcat.1
}
