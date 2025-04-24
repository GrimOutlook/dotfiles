#!/usr/bin/env -S bash -l
set -euo pipefail

export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
for file in $(fd -t f . "$SCRIPT_DIR/bash/functions/"); do
    source "$file"
done

export DOTFILES="$SCRIPT_DIR"

install_files=$(fd -t f --min-depth 2 "install.bash" $DOTFILES)
for install in "$install_files"; do 
    "$install"
done
