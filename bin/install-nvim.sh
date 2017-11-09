#!/usr/bin/env bash

set -eu

main() {
    install
    echo 'Setup complete.'
}

install() {
    mkdir -p "$HOME/.config"
    git clone -b neovim https://github.com/marblenix/vim-setup "$HOME/.config/nvim"
    mkdir -p "$HOME/.config/nvim/pack/minpac/opt" "$HOME/.cache/nvim/session/"{backup,swap,undo}
    git clone https://github.com/k-takata/minpac.git "$HOME/.config/nvim/pack/minpac/opt/minpac"
    nvim -U "$HOME/.config/nvim/plugin.vim" -u "$HOME/.config/nvim/plugin.vim" +PluginInstallAndQuit &>/dev/null
}

main
