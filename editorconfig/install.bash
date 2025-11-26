#!/usr/bin/env bash
set -euo pipefail

EDITORCONFIG="$DOTFILES/editorconfig"
mklink "$EDITORCONFIG/.editorconfig" "$HOME/.editorconfig"
