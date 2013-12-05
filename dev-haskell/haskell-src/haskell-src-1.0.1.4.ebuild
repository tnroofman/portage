# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/haskell-src/haskell-src-1.0.1.4.ebuild,v 1.7 2012/09/12 15:32:33 qnikst Exp $

# ebuild generated by hackport 0.2.9

EAPI="3"

CABAL_FEATURES="lib profile haddock hscolour"
inherit base haskell-cabal

DESCRIPTION="Support for manipulating Haskell source code"
HOMEPAGE="http://hackage.haskell.org/package/haskell-src"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6
		dev-haskell/happy"

PATCHES=("${FILESDIR}/${PN}-1.0.1.4-ghc-7.2.patch")