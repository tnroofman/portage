# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/python-imaging/python-imaging-0.ebuild,v 1.1 2013/06/01 19:24:37 floppym Exp $

EAPI=5

DESCRIPTION="Virtual for Python Imaging Library"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sparc x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE="tk"

RDEPEND="|| (
	dev-python/pillow[tk?]
	dev-python/imaging[tk?]
)"
