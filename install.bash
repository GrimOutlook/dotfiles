#!/usr/bin/env -S bash -l
set -euo pipefail

export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
for file in $(fd -t f . "$SCRIPT_DIR/bash/functions/"); do
    source "$file"
done

export DOTFILES="$SCRIPT_DIR"

# Install Bash stuff
bash -l $DOTFILES/bash/install.bash

# Install TMUX stuff
$DOTFILES/tmux/install.bash

# Install git stuff
$DOTFILES/git/install.bash

# Install neovim stuff
$DOTFILES/neovim/install.bash

# Install miscellaneous items
$DOTFILES/misc/install.bash
