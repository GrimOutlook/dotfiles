#!/usr/bin/env bash

: ${DOTFILES:=$HOME/.dotfiles}

mklink $DOTFILES/misc/eza $HOME/.config/eza
