# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/sfl/sfl-2.2-r1.ebuild,v 1.1 2013/10/29 15:35:52 mrueg Exp $

EAPI=5
USE_RUBY="ruby18 ruby19 ruby20"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="This library provides spawn() which is almost perfectly compatible with ruby 1.9's."
HOMEPAGE="https://github.com/ujihisa/spawn-for-legacy"

LICENSE="|| ( Ruby BSD-2 )"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

IUSE=""

all_ruby_prepare() {
	rm -f Gemfile* || die
	sed -i -e "s:/tmp:${TMPDIR}:" spec/sfl_spec.rb || die
}
