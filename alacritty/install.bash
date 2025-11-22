#!/usr/bin/env bash
set -euo pipefail

ALACRITTY="$DOTFILES/alacritty"

mklink "$ALACRITTY/alacritty.toml" "$CONFIG/alacritty/alacritty.toml"
