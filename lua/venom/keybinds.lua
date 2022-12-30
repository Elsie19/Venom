-- ========================
-- 		Important Stuff
-- ========================

-- Set easy to get to variable for setting keybindings
--[[
Heres how `map` works: The first arg is what mode this keybinding should run in. The second arg is the actual keybinding, The third is what should happen when you run the keybinding, and the fourth is for extra arguments.
--]]

local map = vim.api.nvim_set_keymap

-- Set keybinding to quit Neovim
map("n", "<leader>q", [[:q<CR>]], { desc = "Quit Neovim" })
-- Set keybinding to replace text with `S`
map("n", "S", [[:%s//g<Left><Left>]], { desc = "Replace text" })
-- Set keybinding to run LazyGit
map("n", "<leader>g", [[:LazyGit<CR>]], { desc = "Open LazyGit" })
-- Set keybinding to run Bracey
map("n", "m", [[:Bracey<CR>]], { desc = "Run Bracey" })
-- Set keybinding to toggle tree
map("n", "<leader>b", [[:NvimTreeToggle<CR>]], { desc = "Toggle NvimTree" })
-- Set keybinding to trigger code action menu
map("n", "ca", [[:CodeActionMenu<CR>]], { desc = "Trigger CodeActionMenu" })

local builtin = require("telescope.builtin")
local wk = require("which-key")
wk.register({
	f = {
		name = "Telescope",
		f = { builtin.find_files, "Find Files" },
		g = { builtin.live_grep, "Find Words" },
		b = { builtin.buffers, "Find Buffers" },
		h = { builtin.help_tags, "Find Help Tags" },
	},
}, { prefix = "<leader>" })

-- ====================
--     Your Stuff
-- ====================
