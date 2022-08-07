o.completeopt = "menuone,noselect"


-- =============================================
-- 										Visuals
-- =============================================

-- turn line numbers on the side of the window on
wo.number = true

-- set relative line numbers
wo.relativenumber = true

-- set background based off of colorscheme I think
o.termguicolors = true

-- set color capabilities to 256
g.t_co = 256

-- set cursorline
vim.opt.cursorline = true

-- set indent line
g.indentLine_char = '│'


-- =============================================
-- 								Functionality
-- =============================================

-- turn on mouse support
o.mouse = 'a'

-- Copy paste between neovim and other programs
vim.cmd([[ set clipboard=unnamedplus ]])

-- disable indent lines on startify
g.indentLine_fileTypeExclude = {'startify'}
