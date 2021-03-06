# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/net-ssh-multi/net-ssh-multi-1.2.0-r1.ebuild,v 1.1 2013/11/26 02:26:56 mrueg Exp $

EAPI=5
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGES.txt README.rdoc"

RUBY_FAKEGEM_TASK_TEST="none"

inherit ruby-fakegem

DESCRIPTION="Net::SSH::Multi is a library for controlling multiple Net::SSH
connections via a single interface."
HOMEPAGE="http://net-ssh.rubyforge.org/multi"
SRC_URI="https://github.com/net-ssh/${PN}/archive/v${PV}.tar.gz -> ${P}-git.tgz"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/net-ssh-2.6.5
	>=dev-ruby/net-ssh-gateway-1.2.0"

each_ruby_test() {
	${RUBY} -Ilib:test test/test_all.rb || die
}
