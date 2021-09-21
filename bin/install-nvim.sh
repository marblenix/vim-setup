#!/usr/bin/env bash

set -e

config_dir="$(nvim --cmd "echo stdpath('config')" --cmd qall 2>&1)"

mkdir -p "$config_dir" \
    "$HOME/.cache/nvim/session/backup" \
    "$HOME/.cache/nvim/session/swap" \
    "$HOME/.cache/nvim/session/undo"

git clone --depth 1 -b neovim https://github.com/marblenix/vim-setup "$config_dir"
git clone --depth 1 https://github.com/junegunn/vim-plug "$config_dir/pack/vim-plug/opt/vim-plug/plugin"

nvim --headless -u "$config_dir/plugin.vim" -c PlugInstall -c qall
echo "Setup complete."
