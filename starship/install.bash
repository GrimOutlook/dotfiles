#!/usr/bin/env bash

STARSHIP="$(absolute-parent $BASH_SOURCE)"

mklink "$STARSHIP/starship.toml" "$HOME/.config/starship.toml"

