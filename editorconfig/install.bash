#!/usr/bin/env bash

EDITORCONFIG="$DOTFILES/editorconfig"
mklink "$EDITORCONFIG/.editorconfig" "$HOME/.editorconfig"
