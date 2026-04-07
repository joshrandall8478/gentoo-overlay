# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13} )

inherit distutils-r1 pypi

DESCRIPTION="Jac programming language - Python superset with AI-native constructs"
HOMEPAGE="https://jaseci.org https://github.com/Jaseci-Labs/jaseci"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# lark and pygls are vendored inside the jaclang source tree
RDEPEND=">=dev-python/llvmlite-0.43.0[${PYTHON_USEDEP}]"
BDEPEND="${RDEPEND}"

distutils_enable_tests pytest
