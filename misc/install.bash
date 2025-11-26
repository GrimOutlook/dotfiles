#!/usr/bin/env -S bash -l
set -euo pipefail

mklink "$DOTFILES/misc/style.yapf" "$CONFIG/yapf/style"
