# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-calamaris/selinux-calamaris-2.20120725-r12.ebuild,v 1.2 2013/03/29 10:51:11 swift Exp $
EAPI="4"

IUSE=""
MODS="calamaris"
BASEPOL="2.20120725-r12"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for calamaris"

KEYWORDS="amd64 x86"