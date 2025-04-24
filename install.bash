#!/usr/bin/env -S bash -l
set -euo pipefail

export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
for file in $(fd -t f . "$SCRIPT_DIR/bash/functions/"); do
    source "$file"
done

export DOTFILES="$SCRIPT_DIR"

fd -t d --max-depth 1 -x bash -c 'test -f "{}/install.bash" || echo "{} does not have an install script." >&2 ' -- . $DOTFILES

install_files=$(fd -t f --min-depth 2 "install.bash" $DOTFILES)
for install in $install_files; do 
	chmod +x "$install"
    "$install"
done
