#!/bin/sh

# Hepno...

export NC='\033[0m'
# Bold
export BBlack='\033[1;30m'       # Black
export BRed='\033[1;31m'         # Red
export BGreen='\033[1;32m'       # Green
export BYellow='\033[1;33m'      # Yellow
export BBlue='\033[1;34m'        # Blue
export BPurple='\033[1;35m'      # Purple
export BCyan='\033[1;36m'        # Cyan
export BWhite='\033[1;37m'       # White

function fancy_message() {
    local MESSAGE_TYPE="${1}"
    local MESSAGE="${2}"

	case ${MESSAGE_TYPE} in
        info) echo -e "[${BGreen}+${NC}] INFO: ${MESSAGE}";;
        warn) echo -e "[${BYellow}*${NC}] WARNING: ${MESSAGE}";;
        error) echo -e "[${BRed}!${NC}] ERROR: ${MESSAGE}";;
        *) echo -e "[${BOLD}?${NORMAL}] UNKNOWN: ${MESSAGE}";;
    esac
}

fancy_message info "Hepno, this script will destroy vscode if installed ;) /s"

sudo pacman -S --noconfirm figlet nodejs npm
# download vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'



cat <<EOF > $HOME/.config/nvim/init.vim
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

" emmet
Plug 'mattn/emmet-vim'

" Syntax stuff
Plug 'vim-syntastic/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'LunarWatcher/auto-pairs', { 'tag': '*' }
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'

" Theme
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'

" Start
Plug 'mhinz/vim-startify'

" Hex colors
Plug 'lilydjwg/colorizer'

" Git related stuff
Plug 'airblade/vim-gitgutter'

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

let g:startify_custom_header =
        \ startify#pad(split(system('figlet -t -c "Hello Hepno"'), '\n'))

" Set find and replace to a more easy system
nnoremap S :%s//g<Left><Left>

set backspace=indent,eol,start  " Make backspace work
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set t_Co=256                    " Set if term supports 256 colors.
set nobackup                    " No auto backups
set noswapfile                  " No swap
set encoding=utf-8
" Set hybrid line numbers
set number relativenumber
set nu rnu
" allow mouse use in vim
set mouse=a

" NERDTree stuff
autocmd vimenter * NERDTree | wincmd p
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=34
let g:NERDTreeMouseMode=3

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
nnoremap <leader>md :Bracey

" Leader key
let mapleader = " "
map <leader>q :q<cr>

" ctrl P stuff
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
EOF


nvim -c ":PlugInstall"
nvim -c ":CocInstall coc-sh coc-java coc-html coc-python"

fancy_message info "You should really install a nerd font for superior fonts (try ${BCyan}nerd-fonts-fira-code${NC} from the AUR)"
