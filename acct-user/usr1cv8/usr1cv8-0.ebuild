# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="1C server program user"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( grp1cv8 )
ACCT_USER_HOME=/var/lib/usr1cv8
ACCT_USER_HOME_PERMS=0700
ACCT_USER_SHELL=/bin/sh
acct-user_add_deps
SLOT="0"
