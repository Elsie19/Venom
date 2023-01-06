-- Close last window if it is NvimTree
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})

vim.cmd([[ au BufRead,BufNewFile *.pacscript set filetype=bash ]])
vim.cmd([[ au BufRead,BufNewFile PACBUILD set filetype=bash ]])

-- HACK WARNING AHEAD
-- Ok basically nvim-tree won't allow a simple command such as `silent! autocmd vimenter * NvimTreeToggle | wincmd p`, I have no idea why, so basically I have to get the timer to trigger it right after.
local function tree_toggle_on_setup()
	require("nvim-tree").toggle(false, true)
end

vim.fn.timer_start(0, tree_toggle_on_setup)
-- HACK WARNING FINISHED
