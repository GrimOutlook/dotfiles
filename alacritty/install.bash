#!/usr/bin/env bash

ALACRITTY="$(absolute-parent $BASH_SOURCE)"

mklink "$ALACRITTY/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
