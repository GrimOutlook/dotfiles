#!/usr/bin/env bash

BASH_FUNCTIONS="$DOTFILES/bash/aliases"
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

alias explicitly-installed='pacman -Qe'
alias cat='bat'
alias dotfiles='cd $DOTFILES'
alias home='cd $HOME'
alias cdd='cd ..'
alias e='$EDITOR'
alias edit='$EDITOR'
alias bash_aliases='$EDITOR $HOME/.bash_aliases'
alias bashrc='$EDITOR $HOME/.bashrc'

alias ca='commit-all'
alias pa='push-all'
alias aa='add-all'
alias st='git status --short'
alias ig='git check-ignore -v -- **/*'
alias sed='sd'
