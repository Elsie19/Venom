-- ========================
-- 		Important Stuff
-- ========================

-- Set easy to get to variable for setting keybindings
--[[
Heres how `map` works: The first arg is what mode this keybinding should run in. The second arg is the actual keybinding, The third is what should happen when you run the keybinding, and the fourth is for extra arguments.
--]]
local map = vim.api.nvim_set_keymap

-- Set leader key to space
g.mapleader = ' '

-- Set keybinding to quit Neovim
map('n', '<leader>q', [[:q<CR>]], {})
-- Set keybinding to replace text with `S`
map('n', 'S', [[:%s//g<Left><Left>]], {})
-- Set keybinding to run LazyGit
map('n', '<leader>g', [[:LazyGit<CR>]], {})
-- Set keybinding to run Bracey
map('n', 'm', [[:Bracey<CR>]], {})
-- Set keybinding to toggle tree
map('n', '<C-b>', [[:NvimTreeToggle<CR>]], {})

-- ====================
--     Your Stuff
-- ====================
