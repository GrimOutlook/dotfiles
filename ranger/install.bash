#!/usr/bin/env -S bash -l
set -euo pipefail

RANGER_DIR=$DOTFILES/ranger

mklink $RANGER_DIR/ $HOME/.config/ranger/ || exit 1
