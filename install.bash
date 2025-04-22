#!/usr/bin/env bash
set -euxo pipefail

export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
for file in $(fd -t f . "$SCRIPT_DIR/bash/functions/"); do
    source "$file"
done

export DOTFILES="$SCRIPT_DIR"

# Install Bash stuff
source $DOTFILES/bash/install.bash

# Install TMUX stuff
source $DOTFILES/tmux/install.bash

# Install git stuff
source $DOTFILES/git/install.bash

# Install neovim stuff
source $DOTFILES/neovim/install.bash

# Install miscellaneous items
source $DOTFILES/misc/install.bash
