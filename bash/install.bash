#!/usr/bin/env -S bash -l
set -euo pipefail

BASH_DIR=$DOTFILES/bash

mklink=$BASH_DIR/scripts/mklink

$mklink $BASH_DIR/.bashrc $HOME/.bashrc || exit 1
$mklink $BASH_DIR/.bash_aliases $HOME/.bash_aliases || exit 1
$mklink $BASH_DIR/.bash_completions $HOME/.bash_completions || exit 1

