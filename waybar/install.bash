#!/usr/bin/env -S bash -l
set -euo pipefail

mklink "$DOTFILES/waybar/waybar.conf" "$CONFIG/waybar/waybar.conf"
