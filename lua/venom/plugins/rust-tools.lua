return {
	"simrat39/rust-tools.nvim",
	ft = "rust",
	config = function()
		require("rust-tools").setup({
			server = {
				settings = {
					["rust-analyzer"] = {
						-- HACK: https://github.com/simrat39/rust-tools.nvim/issues/300
						inlayHints = { locationLinks = false },
					},
				},
			},
		})
	end,
}
