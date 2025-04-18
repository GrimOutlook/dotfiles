#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return ;;
esac


# Ignore duplicates in bash history
export HISTCONTROL=ignoreboth:erasedups
# Increase bash history size
export HISTSIZE=10000
export HISTFILESIZE=10000

source "$HOME/.cargo/env"

ALIASES=$HOME/.bash_aliases
if [[ -f $ALIASES ]]; then
    source "$ALIASES"
fi
BASH_SCRIPTS=$HOME/.bash_scripts
if [[ -d $BASH_SCRIPTS ]]; then
    for file in $(fd -t f . "$BASH_SCRIPTS"); do
        source "$file"
    done
fi

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Launch the startship prompt
eval "$(starship init bash)"
