#!/usr/bin/env -S bash -l
set -euo pipefail

export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export PATH+=":$SCRIPT_DIR/bash/scripts/"

export DOTFILES="$SCRIPT_DIR"

# TODO: Use the install_files variable from below to check what doesn't have an
# install file.
fd -t d --max-depth 1 --absolute-path -x \
	bash -c 'test -f "{}/install.bash" || echo "{} does not have an install script." >&2 ' \; . "$DOTFILES"

install_files=$(fd -t f --absolute-path --min-depth 2 "install.bash" "$DOTFILES")
for install in $install_files; do 
    chmod +x "$install"
    "$install"
done
