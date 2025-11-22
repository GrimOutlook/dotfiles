#!/usr/bin/env bash
set -euo pipefail

STARSHIP="$(absolute-parent $BASH_SOURCE)"

mklink "$STARSHIP/starship.toml" "$HOME/.config/starship.toml"
