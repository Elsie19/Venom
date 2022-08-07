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
        info) echo -e "[${BGreen}+${NC}] INFO: ${MESSAGE}" ;;
        warn) echo -e "[${BYellow}*${NC}] WARNING: ${MESSAGE}" ;;
        error) echo -e "[${BRed}!${NC}] ERROR: ${MESSAGE}" ;;
        *) echo -e "[${BOLD}?${NORMAL}] UNKNOWN: ${MESSAGE}" ;;
  esac
}

fancy_message warn "You will need neovim 0.5.0 or higher for some features to work"

program() {
    [[ -x "$(command -v "$1")" ]]
}
if ! program git; then
    fancy_message error "git not installed"
  exit 1
fi
if ! program sudo; then
    fancy_message error "sudo not installed"
  exit 1
fi
if program pacman; then
    sudo pacman -Syu --noconfirm neovim python-pyflakes figlet nodejs npm shellcheck eslint lazygit cargo rust # figlet for startity, nodejs for CoC, npm for ALE, shellcheck eslint for ALE
elif program apt-get; then
    sudo apt-get install pyflakes figlet nodejs npm shellcheck eslint rustc
fi

mkdir -pv $HOME/.config/nvim
mkdir -pv $HOME/.local/share/venom

# Install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cd /tmp
git clone https://github.com/Henryws/Venom
cd Venom
cp -rf lua ~/.config/nvim
cp init.lua ~/.config/nvim
cp -ff ascii.txt ~/.local/share/venom/
cd ..
rm -rf Venom

nvim -c 'PackerSync'
nvim -c 'COQdeps' \
	-c 'COQnow' \
	-c 'COQsnips'
