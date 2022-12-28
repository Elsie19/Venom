vim.opt.completeopt = "menuone,noselect"

-- =============================================
-- 					Visuals
-- =============================================

-- turn line numbers on the side of the window on
vim.opt.number = true

-- set relative line numbers
vim.opt.relativenumber = true

-- set background based off of colorscheme I think
vim.opt.termguicolors = true

-- set color capabilities to 256
vim.g.t_co = 256

-- set cursorline
vim.opt.cursorline = true

-- set indent line
vim.g.indentLine_char = "│"

-- =============================================
-- 				Functionality
-- =============================================

-- turn on mouse support
vim.opt.mouse = "a"

-- Copy paste between neovim and other programs
vim.opt.clipboard = "unnamedplus"

-- disable indent lines on startify
vim.g.indentLine_fileTypeExclude = { "startify" }

-- Set lazy redraw, which will mean the screen won't be redrawn when executing macros, registers
-- and other commands that haven't been typed
vim.opt.lazyredraw = true
