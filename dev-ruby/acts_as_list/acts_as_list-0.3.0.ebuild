# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/acts_as_list/acts_as_list-0.3.0.ebuild,v 1.1 2013/08/22 05:53:11 graaff Exp $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_RECIPE_TEST="none"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

DESCRIPTION="Capabilities for sorting and reordering a number of objects in a list."
HOMEPAGE="http://rake.rubyforge.org/"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64 ~x86 ~x86-macos"
IUSE=""

ruby_add_bdepend "
	test? (
		dev-ruby/test-unit:2
		dev-ruby/activerecord[sqlite3]
	)"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/d' Rakefile || die
	sed -i -e '1,9d' test/helper.rb || die
	sed -i -e '/git ls/d' ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_test() {
	ruby-ng_testrb-2 -Ilib test/test_*.rb
}