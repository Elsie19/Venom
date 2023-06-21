-- Set main colorscheme here
local dracula = require("dracula")
dracula.setup({
	overrides = {
		debugPc = {
			bg = "#303030"
		}
	},
})
vim.cmd.colorscheme("dracula")
