# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-leechcraft/lc-deadlyrics/lc-deadlyrics-0.6.0.ebuild,v 1.1 2013/09/24 15:43:08 maksbotan Exp $

EAPI="4"

inherit leechcraft

DESCRIPTION="Searches for song lyrics and displays them in LeechCraft"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}"
RDEPEND="${DEPEND}
		virtual/leechcraft-search-show
		virtual/leechcraft-downloader-http"
