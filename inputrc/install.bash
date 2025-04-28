#!/usr/bin/env -S bash -l
set -euo pipefail

mklink "$DOTFILES/inputrc/inputrc" "$HOME/.inputrc"
