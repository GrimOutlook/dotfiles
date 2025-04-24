#!/usr/bin/env -S bash -l

ALACRITTY="$DOTFILES/alacritty"

mklink "$ALACRITTY/alacritty.toml" "$CONFIG/alacritty/alacritty.toml"
