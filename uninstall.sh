#!/bin/sh

# Stops further execution after any error.
set -e

source helpers.sh

[ -L ~/.config/nvim ] && rm ~/.config/nvim
[ -L ~/.vim ] && rm ~/.vim
[ -L ~/.vimrc ] && rm ~/.vimrc

getnf -u DroidSansMono,Hack && echo "$(check) Nerd fonts uninstalled"

echo "$(check) vimrc successfully uninstalled"
