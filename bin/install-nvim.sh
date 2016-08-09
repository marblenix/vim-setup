#!/bin/bash

set -eu

main() {
  install
  echo 'Setup complete.'
}

install() {
  git clone https://github.com/marblenix/vim-setup ~/.vim
  mkdir -p ~/.vim/bundle ~/.vim/session/{backup,swap,undo}
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  nvim -U ~/.vim/plugin.vim -u ~/.vim/plugin.vim +PluginInstall +qall &>/dev/null
  mkdir -p ~/.config/nvim
  ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
}

main
