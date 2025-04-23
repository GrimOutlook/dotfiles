#!/usr/bin/env -S bash -l
set -euo pipefail

GIT_DIR="$SCRIPT_DIR/git"

mklink "$GIT_DIR/.gitconfig" "$HOME/.gitconfig" || exit 1
