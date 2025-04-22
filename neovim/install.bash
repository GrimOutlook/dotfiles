#!/usr/bin/env bash

NVIM_DIR=$DOTFILES/neovim

mklink $NVIM_DIR/ $HOME/.config/nvim/ || exit 1
