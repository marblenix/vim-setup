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
  vim -U ~/.vim/plugin.vim -u ~/.vim/plugin.vim +PluginInstall +qall &>/dev/null
  ln -s ~/.vim/vimrc ~/.vimrc
}

main
