#!/usr/bin/env bash
set -euo pipefail

TMUX_DIR=$DOTFILES/tmux

mklink "$TMUX_DIR/" "$CONFIG/tmux/" || exit 1

# Install TPM if it doesn't exist
if test ! -d ~/.tmux/plugins/tpm; then
    git clone --depth 1 --branch v3.1.0 \
        https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm || exit 1
fi

$HOME/.tmux/plugins/tpm/bin/install_plugins || exit 1
