# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/gnome-clocks/gnome-clocks-3.8.1.ebuild,v 1.2 2013/05/09 16:42:34 pacho Exp $

EAPI="5"
GCONF_DEBUG="no"
VALA_MIN_API_VERSION="0.18"

inherit gnome2 vala

DESCRIPTION="Clocks application for GNOME"
HOMEPAGE="http://live.gnome.org/GnomeClocks"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-libs/glib-2.30:2
	>=x11-libs/gtk+-3.7.12:3
	>=media-libs/libcanberra-0.30
	>=dev-libs/libgweather-3.7.90
	>=gnome-base/gnome-desktop-3.7.90
	>=x11-libs/libnotify-0.7
"
DEPEND="${RDEPEND}
	$(vala_depend)"

src_prepare() {
	gnome2_src_prepare
	vala_src_prepare
}
