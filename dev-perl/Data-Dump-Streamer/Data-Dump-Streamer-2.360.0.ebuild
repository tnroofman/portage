# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Data-Dump-Streamer/Data-Dump-Streamer-2.360.0.ebuild,v 1.1 2013/08/15 06:59:30 patrick Exp $

EAPI=4

MODULE_AUTHOR=YVES
MODULE_VERSION=2.36
inherit perl-module

DESCRIPTION="Accurately serialize a data structure as Perl code"

SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"
IUSE="test"

RDEPEND=">=dev-perl/B-Utils-0.07"
DEPEND="${RDEPEND}
	virtual/perl-Module-Build
	test? (
		dev-perl/JSON-XS
	)
"

SRC_TEST=do

src_prepare() {
	# Add DDS.pm shortcut
	echo 'yes' > "${S}"/.answer
	perl-module_src_prepare
}
