let g:ale_disable_lsp = 1
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()
" Fancy bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Sidebar
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ervandew/supertab'
" emmet
Plug 'mattn/emmet-vim'
" Syntax stuff
" Check for invalid syntax
Plug 'vim-syntastic/syntastic'
" Small language server
Plug 'sheerun/vim-polyglot'
" Other stuff
Plug 'tpope/vim-surround'
" Matcher stuff
Plug 'tmsvg/pear-tree'
" Spicy icons
Plug 'ryanoasis/vim-devicons'
" Set lines during indents
Plug 'Yggdroot/indentLine'
" Highlights matching sets
Plug 'andymass/vim-matchup'
" Linting
Plug 'dense-analysis/ale'
Plug 'habamax/vim-godot'
" Commenter
Plug 'preservim/nerdcommenter'
" Theme
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sickill/vim-monokai'
Plug 'connorholyday/vim-snazzy'
" Start
Plug 'mhinz/vim-startify'
Plug 'pbrisbin/vim-mkdir'
" Hex colors
Plug 'lilydjwg/colorizer'
" Git related stuff
Plug 'airblade/vim-gitgutter'
" git so good, it's illegal
Plug 'tpope/vim-fugitive'
" Lazygit
Plug 'kdheepak/lazygit.nvim'
" Smooth scrolling
Plug 'psliwka/vim-smoothie'
" Live website stuff
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
" Ctrl P (fuzzy finder)
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='palenight'
" Theming
syntax on
set background=dark
colorscheme palenight
set termguicolors
let g:startify_custom_header =
        \ startify#pad(split(system('cat $HOME/.local/share/venom/ascii.txt'), '\n'))
let g:startify_custom_footer = startify#center(split(system('echo Venom 1.4 Hydra'), '\n'))
" Set find and replace to a more easy system
nnoremap S :%s//g<Left><Left>
set backspace=indent,eol,start  " Make backspace work
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set t_Co=256                    " Set if term supports 256 colors.
set nobackup                    " No auto backups
set noswapfile                  " No swap
set encoding=utf-8              " Set encoding to the one true format
" Set hybrid line numbers
set number relativenumber
set nu rnu
" allow mouse use in vim
set mouse=a
set t_Co=256
" NERDTree stuff
autocmd vimenter * NERDTree | wincmd p
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 34
let g:NERDTreeMouseMode = 3
" Hide certain folders
let NERDTreeIgnore=['\.git$', '\.idea$', '\.vscode$', '\.history$', 'startify']
" Automatically exit neovim if the last window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
" Very spicy pipe
let g:indentLine_char = '│'
" K shows docs
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Automatically re-read file if a change was detected outside of vim
set autoread
" Bracey stuff
let g:bracey_refresh_on_save = 1
nnoremap m :Bracey<CR>
" Leader key
let mapleader = " "
map <leader>q :q<cr>
" ctrl P stuff
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Set proper python linter
let g:syntastic_python_checkers = ['pyflakes']
" Fix startify indent lines
let g:indentLine_fileTypeExclude = ['startify']
let g:indentLine_leadingSpaceEnabled = 0
" make supertab go from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"
" Lazygit
nnoremap <leader>g :LazyGit<CR>
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯']
" to use folding provided by vim-godot
setlocal foldmethod=expr
setlocal tabstop=4
nnoremap <buffer> <F4> :GodotRunLast<CR>
nnoremap <buffer> <F5> :GodotRun<CR>
nnoremap <buffer> <F6> :GodotRunCurrent<CR>
nnoremap <buffer> <F7> :GodotRunFZF<CR>
" Allow ALE to autoimport completion entries from LSP servers
let g:ale_completion_autoimport = 1
" Register LSP server for Godot:
call ale#linter#Define('gdscript', {
\   'name': 'godot',
\   'lsp': 'socket',
\   'address': '127.0.0.1:6008',
\   'project_root': 'project.godot',
\})
" NERDCommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
imap <F8> <Esc>:w<CR>:!clear;python3 %<CR>
