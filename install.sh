#!/bin/sh

# Stops further execution after any error.
set -e

source helpers.sh

[ ! -d ${HOME}/.local/bin ] && mkdir -p ${HOME}/.local/bin

# Check if ~/.local/bin is in $PATH so we can install getnf if necessary.
if [[ ! $(echo $PATH | tr ':' '\n' | grep -x "$HOME/.local/bin") ]]; then
  echo "$(cross) ERROR: ~/.local/bin needs to be in your \$PATH."
  exit
fi

echo "$(check) ~/.local/bin is in \$PATH"

# Install getnf if not already installed.
if [ ! -f ${HOME}/.local/bin/getnf ]; then
  curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
fi

echo "$(check) getnf is installed"

[ ! -d ${HOME}/Library/Fonts/DroidSansMono ] && getnf -i DroidSansMono 
[ ! -d ${HOME}/Library/Fonts/Hack ] && getnf -i Hack 

echo "$(check) Nerd fonts installed"

[ ! -d ${HOME}/.config ] && mkdir ${HOME}/.config
[ ! -d ${HOME}/.config/nvim ] && ln -s ${HOME}/.dotvim/config/nvim ${HOME}/.config/nvim
[ ! -d ${HOME}/.vim ] && ln -s ${HOME}/.dotvim/vim ${HOME}/.vim
[ ! -f ${HOME}/.vimrc ] && ln -s ${HOME}/.dotvim/vimrc ${HOME}/.vimrc

echo "$(check) vimrc successfully installed"
