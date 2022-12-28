vim.opt.completeopt = "menuone,noselect"

-- =============================================
-- 					Visuals
-- =============================================

-- turn line numbers on the side of the window on
vim.opt.number = true

-- set relative line numbers
vim.opt.relativenumber = true

-- set 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- set color capabilities to 256
vim.g.t_co = 256

-- set cursorline
vim.opt.cursorline = true

-- set indent line
vim.g.indentLine_char = "│"

-- hide command line unless needed
vim.opt.cmdheight = 0

-- disable `~` on nonexistent lines
vim.opt.fillchars = { eob = " " }

-- number of lines to keep above and below the cursor
vim.opt.scrolloff = 8

-- number of columns to keep at the sides of the cursor
vim.opt.sidescrolloff = 8

-- Length of time to wait for a mapped sequence
vim.opt.timeoutlen = 300

-- Length of time to wait before triggering the plugin
vim.opt.updatetime = 300

-- Highlight URLs by default
vim.g.highlighturl_enabled = true

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

-- Enable persistent undo
vim.opt.undofile = true

-- Disable making a backup before overwriting a file
vim.opt.writebackup = false
