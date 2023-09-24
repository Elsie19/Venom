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
-- Set keybinding to jump to next buffer
map("n", "<ALT-n>", [[:bnext<CR>]], { desc = "Go to next buffer" })
-- Set keybinding to toggle tree
map("n", "<leader>b", [[:NvimTreeToggle<CR>]], { desc = "Toggle NvimTree" })
map("n", "K", [[:lua vim.lsp.buf.definition()<CR>]], { desc = "Jump to definition" })
-- -- Set keybinding to toggle tree
-- map("n", "bf", [[:bnext<CR>]], { desc = "Go forward in buffer list" })
-- -- Set keybinding to toggle tree
-- map("n", "bp", [[:bprevious<CR>]], { desc = "Go back in buffer list" })
-- Set keybinding to leap backwards
map("n", "_", "<Plug>(leap-backward)", { desc = "Leap backwards" })

map("n", "vrr", [[:lua vim.lsp.buf.references()<CR>]], { desc = "Find occurences of variable" })
map("n", "<C-j>", [[:cn<CR>]], { desc = "Go down in quickfix" })
map("n", "<C-k>", [[:cp<CR>]], { desc = "Go up in quickfix" })

local builtin = require("telescope.builtin")
local wk = require("which-key")

-- Code action
wk.register({
	c = {
		name = "CodeAction",
		a = { "<cmd>CodeActionMenu<cr>", "Run CodeActionMenu" },
	}
}, { prefix = "<leader>" })

-- Telescope
wk.register({
	f = {
		name = "Telescope",
		f = { builtin.find_files, "Find Files" },
		g = { builtin.live_grep, "Find Words" },
		b = { builtin.buffers, "Find Buffers" },
		h = { builtin.help_tags, "Find Help Tags" },
	},
}, { prefix = "<leader>" })

-- nvim-dap
wk.register({
	d = {
		name = "nvim-dap",
		p = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Add a breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue debugging" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
		u = {
			"<cmd>lua require'dapui'.setup()<cr> <cmd>lua require'nvim-dap-virtual-text'.setup()<cr> <cmd>lua require'dapui'.toggle()<cr>",
			"Setup dapui" },
	}
}, { prefix = "<leader>" })

-- ====================
--     Your Stuff
-- ====================
