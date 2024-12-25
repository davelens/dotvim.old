#!/bin/sh

# Stops further execution after any error.
set -e

source helpers.sh

SCRIPT_DIR=$(dirname "$(realpath "$0")")

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
[ ! -L ${HOME}/.config/nvim ] && ln -s ${SCRIPT_DIR}/config/nvim ${HOME}/.config/nvim
[ ! -L ${HOME}/.vim ] && ln -s ${SCRIPT_DIR}/vim ${HOME}/.vim
[ ! -L ${HOME}/.vimrc ] && ln -s ${SCRIPT_DIR}/vimrc ${HOME}/.vimrc

echo "$(check) vimrc successfully installed"
