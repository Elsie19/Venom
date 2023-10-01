return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
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
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
			dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
		}

		-- dashboard.section.footer = {
		-- 	{ type = "text", val = "Venom 3.0.0 Saw-Scaled Viper" },
		-- }

		local fortune = require("alpha.fortune")
		dashboard.section.footer.val = fortune()
		alpha.setup(dashboard.config)
	end,
}
