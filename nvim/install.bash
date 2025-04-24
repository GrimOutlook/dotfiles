#!/usr/bin/env -S bash -l
set -euo pipefail

NVIM_DIR=$DOTFILES/nvim

mklink $NVIM_DIR/ $HOME/.config/nvim/ || exit 1
