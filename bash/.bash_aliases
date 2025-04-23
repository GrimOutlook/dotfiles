#!/usr/bin/env bash

BASH_FUNCTIONS="$DOTFILES/bash/functions"
if [[ -d "$BASH_FUNCTIONS" ]]; then
    for file in $(fd -t f . "$BASH_FUNCTIONS"); do
        source "$file"
    done
else
    echo "Failed to load bash functions" >&2
fi

# Check if work bash aliases exists
WORK_ALIASES="$HOME/.bash_aliases.work"
if [ -f "$WORK_ALIASES" ]; then
    source "$WORK_ALIASES"
fi

alias reload='source $HOME/.bashrc'
alias j='just'
alias grep='rg'
alias time='hyperfine'
alias cp='xcp'
alias mkdir='mkdir -p'
alias docker='podman'
alias debug-bash='set -uxo pipefail'
alias debug-bash-undo='set +uxo pipefail'
