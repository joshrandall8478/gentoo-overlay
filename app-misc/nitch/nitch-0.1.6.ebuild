
EAPI=8

DESCRIPTION="Incredibly fast system fetch written in Nim"
HOMEPAGE="https://github.com/ssleert/nitch"
SRC_URI="https://github.com/ssleert/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+nerd-fonts"

DEPEND="dev-lang/nim"
RDEPEND=""
BDEPEND="dev-lang/nim"

src_prepare() {
	default

	if ! use nerd-fonts; then
		# Replace nerd font icons with ASCII alternatives
		sed -i \
			-e 's/userIcon: string   = "[^"]*"/userIcon: string   = "|>"/' \
			-e 's/hnameIcon: string  = "[^"]*"/hnameIcon: string  = "|>"/' \
			-e 's/distroIcon: string = "[^"]*"/distroIcon: string = "|>"/' \
			-e 's/kernelIcon: string = "[^"]*"/kernelIcon: string = "|>"/' \
			-e 's/uptimeIcon: string = "[^"]*"/uptimeIcon: string = "|>"/' \
			-e 's/shellIcon: string  = "[^"]*"/shellIcon: string  = "|>"/' \
			-e 's/pkgsIcon: string   = "[^"]*"/pkgsIcon: string   = "|>"/' \
			-e 's/ramIcon: string    = "[^"]*"/ramIcon: string    = "|>"/' \
			-e 's/colorsIcon: string = "[^"]*"/colorsIcon: string = "->"/' \
			-e 's/dotIcon: string = "[^"]*"/dotIcon: string = "#"/' \
			src/funcs/drawing.nim || die "sed failed"
	fi
}

# Compile nitch
src_compile() {
	nim compile \
		-d:release \
		--opt:speed \
		--path:src \
		--out:nitch \
		src/nitch.nim || die "nim compile failed"
}

# Install nitch
src_install() {
	dobin nitch
	dodoc README.md
}
