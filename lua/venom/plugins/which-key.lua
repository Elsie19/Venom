return {
	"folke/which-key.nvim",
	opts = {
		plugins = {
			spelling = { enabled = true },
			presets = { operators = false },
		},
		window = {
			border = "rounded",
			padding = { 2, 2, 2, 2 },
		},
		disable = { filetypes = { "TelescopePrompt" } },
	},
}
