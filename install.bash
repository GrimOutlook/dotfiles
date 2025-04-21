#!/usr/bin/env bash
set -euxo pipefail

export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
for file in $(fd -t f . "$SCRIPT_DIR/bash/functions/"); do
    source "$file"
done

# Install TMUX stuff
source /home/$USER/.dotfiles/tmux/install.bash
