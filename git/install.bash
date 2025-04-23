#!/usr/bin/env bash

GIT_DIR="$SCRIPT_DIR/git"

mklink "$GIT_DIR/.gitconfig" "$HOME/.gitconfig" || exit 1
