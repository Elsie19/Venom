return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")
		startify.section.header.val = {
			[[       ---_ ......._-_--.]],
			[[      (|\ /      / /| \  \]],
			[[      /  /     .'  -=-'   `.]],
			[[     /  /    .'             )]],
			[[   _/  /   .'        _.)   /]],
			[[  / o   o        _.-' /  .']],
			[[  \          _.-'    / .'*|]],
			[[   \______.-'//    .'.' \*|]],
			[[    \|  \ | //   .'.' _ |*|]],
			[[     `   \|//  .'.'_ _ _|*|]],
			[[      .  .// .'.' | _ _ \*|]],
			[[      \`-|\_/ /    \ _ _ \*\]],
			[[       `/'\__/      \ _ _ \*\]],
			[[      /^|            \ _ _ \*]],
			[[     '  `             \ _ _ \]],
			[[                       \_]],
		}

		startify.section.footer = {
			{ type = "text", val = "Venom 3.0.0 Saw-Scaled Viper" },
		}

		alpha.setup(startify.config)
	end,
}
