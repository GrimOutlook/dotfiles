#!/usr/bin/env bash
set -euxo pipefail

export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
for file in $(fd -t f . "$SCRIPT_DIR/bash/functions/"); do
    source "$file"
done

# Install Bash stuff
source $HOME/.dotfiles/tmux/install.bash

# Install TMUX stuff
source $HOME/.dotfiles/tmux/install.bash

# Install git stuff
source $HOME/.dotfiles/git/install.bash

# Install neovim stuff
source $HOME/.dotfiles/neovim/install.bash
