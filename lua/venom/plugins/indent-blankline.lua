return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	config = function()
		require("indent_blankline").setup({
			show_current_context = true,
			show_current_context_start = true,
		})
	end,
}
