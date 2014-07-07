#!/bin/bash

set -eu

main() {
  install
  reset
  stty sane
  echo 'Setup complete, you should now install the-silver-searcher, par, and exuberant ctags'
}

install() {
  git clone https://github.com/marblenix/vim-setup ~/.vim
  mkdir -p ~/.vim/bundle ~/.vim/session/{backup,swap,undo}
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim -U ~/.vim/bin/temprc -u ~/.vim/bin/temprc +PluginInstall +qall
  ln -s ~/.vim/vimrc ~/.vimrc
}

main
