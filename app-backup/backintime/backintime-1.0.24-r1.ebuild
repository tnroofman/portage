# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-backup/backintime/backintime-1.0.24-r1.ebuild,v 1.2 2013/07/28 08:12:45 jcallen Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit eutils python-single-r1

DESCRIPTION="A simple backup system inspired by TimeVault and FlyBack, with a GUI for GNOME and KDE4"
HOMEPAGE="http://backintime.le-web.org/"
SRC_URI="http://${PN}.le-web.org/wp-content/uploads/2009/03/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="kde gnome"

RDEPEND="${PYTHON_DEPEND}
	dev-python/keyring[${PYTHON_USEDEP}]
	dev-python/notify-python[${PYTHON_USEDEP}]
	net-misc/rsync[xattr,acl]
	kde? (
		>=kde-base/kdelibs-4
		kde-base/pykde4[${PYTHON_USEDEP}]
		kde-base/kompare
		kde-base/kdesu
		)
	gnome? (
		gnome-base/libglade
		dev-util/meld
		gnome-base/gnome-session
		dev-python/gnome-vfs-python
		dev-python/libgnome-python
		dev-python/pygobject:2[${PYTHON_USEDEP}]
		dev-python/pygtk[${PYTHON_USEDEP}]
		)"

DEPEND="${RDEPEND}"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

S=${WORKDIR}

src_prepare() {
	epatch "${FILESDIR}"/${P}-dont-install-license.patch
	epatch "${FILESDIR}"/${PN}-1.0.4-fix-configure-warning.diff

	#fix doc install location
	sed -i "s:/doc/kde4/HTML/:/doc/HTML/:g" kde4/Makefile.template || die
	sed -i "s:/doc/backintime:/doc/${PF}:g" common/Makefile.template || die

	cp "${FILESDIR}"/backintime-1.0.4-kde4-root.desktop \
		kde4/backintime-kde4-root.desktop || die

	epatch "${FILESDIR}"/${PN}-1.0.6-wrapper.patch
	sed -e "/ python /s:python:${PYTHON}:" \
		-e "/^APP_PATH=/s:/usr:${EPREFIX}/usr:" \
		-i common/backintime \
		-i gnome/backintime-gnome \
		-i kde4/backintime-kde4 || die

	backintime_variants="common $(usex gnome gnome "") $(usex kde kde4 '')"
	backintime_run() {
		local variant
		for variant in ${backintime_variants} ; do
			einfo "$variant: run \"$@\""
			pushd "${S}"/${variant} || die
			"${@}" || die
			popd
		done
	}

	if [ -n ${LINGUAS+x} ] ; then
		cd common/po || die
		for po in *.po ; do
			if ! has ${po/.po} ${LINGUAS} ; then
				rm ${po} || die
			fi
		done
	fi
}

src_configure() {
	backintime_run econf
}

src_compile() {
	backintime_run emake
}

src_install() {
	backintime_run emake DESTDIR="${D}" install
}

pkg_postinst() {
	python_optimize "${D}"
}
