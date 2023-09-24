-- Close last window if it is NvimTree
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	nested = true,
-- 	callback = function()
-- 		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
-- 			vim.cmd("quit")
-- 		end
-- 	end,
-- })
--
vim.cmd([[ au BufRead,BufNewFile *.pacscript set filetype=bash ]])
vim.cmd([[ au BufRead,BufNewFile PACBUILD set filetype=bash ]])
vim.cmd([[ au BufRead,BufNewFile *.nuon set filetype=json ]])
--
-- local function open_nvim_tree()
--   -- open the tree
--   require("nvim-tree.api").tree.toggle({ focus = false })
-- end
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
