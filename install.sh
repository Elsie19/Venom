#!/bin/bash

export NC='\033[0m'
# Bold
export BRed='\033[1;31m'         # Red
export BGreen='\033[1;32m'       # Green
export BYellow='\033[1;33m'      # Yellow
export BCyan='\033[1;36m'        # Cyan

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

fancy_message warn "You will need neovim 0.5.0 or higher for some features to work"

program() {
    [[ -x "$(command -v "$1")" ]]
}
if ! program git; then
    fancy_message error "git not installed"
fi
if ! program sudo; then
    fancy_message error "sudo not installed"
fi
if program pacman; then
    sudo pacman -Syu --noconfirm neovim python-pyflakes figlet nodejs npm shellcheck eslint lazygit cargo rust # figlet for startity, nodejs for CoC, npm for ALE, shellcheck eslint for ALE
elif program apt-get; then
    sudo apt-get install pyflakes figlet nodejs npm shellcheck eslint rustc
fi

# download vim plug
mkdir -pv $HOME/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -pv $HOME/.local/share/fonts
mkdir -pv $HOME/.local/share/venom
curl -s https://raw.githubusercontent.com/Henryws/Venom/master/ascii.txt > $HOME/.local/share/venom/ascii.txt

curl -fLo "${HOME:-~}/.config/nvim/init.vim" --create-dirs \
    https://raw.githubusercontent.com/Henryws/Venom/master/init.vim
# Install the plugins and CoC stuff
nvim -c ":PlugInstall|qa!"
nvim -c "CocInstall -sync coc-sh coc-java coc-html coc-css coc-omnisharp coc-tsserver|q"
npm install --save-dev htmlhint
# this will hook into godot (if running, and provide the language server)
echo '{
    "languageserver": {
        "godot": {
            "host": "127.0.0.1",
            "filetypes": ["gdscript"],
            "port": 6008
        }
    },
    "coc.preferences.jumpCommand": "tabe"
}
' > "${HOME:-~}"/.config/nvim/coc-settings.json
if command -v paru &>/dev/null; then
    paru -S nerd-fonts-fira-code csslint
    exit
else
    fancy_message info "You should really install a nerd font for superior fonts (try ${BCyan}nerd-fonts-fira-code${NC} from the AUR)"
fi
