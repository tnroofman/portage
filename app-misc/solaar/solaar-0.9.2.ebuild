# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/solaar/solaar-0.9.2.ebuild,v 1.1 2013/08/27 20:55:41 radhermit Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_2,3_3} )

inherit distutils-r1 udev user linux-info gnome2-utils

DESCRIPTION="A Linux device manager for Logitech's Unifying Receiver peripherals"
HOMEPAGE="http://pwr.github.com/Solaar/"
SRC_URI="https://github.com/pwr/Solaar/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND=">=dev-python/pyudev-0.13[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]"

S=${WORKDIR}/Solaar-${PV}

CONFIG_CHECK="~HID_LOGITECH_DJ"

python_install_all() {
	distutils-r1_python_install_all

	udev_dorules rules.d/*.rules

	if use doc; then
		dodoc -r docs/*
	fi
}

pkg_postinst() {
	enewgroup plugdev

	if [[ -z ${REPLACING_VERSIONS} ]] ; then
		elog "Users must be in the plugdev group to use this application."
	fi

	gnome2_icon_cache_update
}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postrm() { gnome2_icon_cache_update; }
