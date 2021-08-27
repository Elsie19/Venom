#!/bin/sh

# Hepno...

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

# download vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


cat <<EOF > $HOME/.config/nvim/init.vim
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Fancy bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Sidebar
Plug 'preservim/nerdtree'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" emmet
Plug 'mattn/emmet-vim'

" Syntax stuff
Plug 'vim-syntastic/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'

" Theme
Plug 'joshdick/onedark.vim'

" Start
Plug 'mhinz/vim-startify'

" Hex colors
Plug 'lilydjwg/colorizer'


call plug#end()

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
autocmd VimEnter * NERDTree | wincmd p

" Theming
syntax on
set background=dark
colorscheme onedark

let g:startify_custom_header =
        \ startify#pad(split(system('figlet -t -c "Hello Hepno"'), '\n'))

" Set find and replace to a more easy system
nnoremap S :%s//g<Left><Left>

set backspace=indent,eol,start
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set t_Co=256                    " Set if term supports 256 colors.
set nobackup                    " No auto backups
set noswapfile                  " No swap

" NERDTree stuff
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=34
EOF


nvim -c ":PluginInstall"
nvim -c ":CocInstall coc-sh coc-java coc-html"
