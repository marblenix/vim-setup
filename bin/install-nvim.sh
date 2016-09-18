#!/usr/bin/env bash

set -eu

main() {
  install
  echo 'Setup complete.'
}

install() {
  mkdir -p "$HOME/.config"
  git clone -b neovim https://github.com/marblenix/vim-setup "$HOME/.config/nvim"
  mkdir -p "$HOME/.config/nvim/bundle" "$HOME/.config/nvim/session/"{backup,swap,undo}
  git clone https://github.com/gmarik/Vundle.vim.git "$HOME/.config/nvim/bundle/Vundle.vim"
  nvim -U "$HOME/.config/nvim/plugin.vim" -u "$HOME/.config/nvim/plugin.vim" +PluginInstall +qall &>/dev/null
}

main
