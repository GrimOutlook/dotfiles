#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return ;;
esac

# Verify that:
# 1. TMUX command exists
# 2. PS1 string is set and isn't ""
# 3. We aren't in a screen session
# 4. We aren't in a TMUX session already
# 5. Additional check to make sure we aren't in a tmux session
if command -v tmux &> /dev/null && \
    [ -n "$PS1" ] && \
    [[ ! "$TERM" =~ screen ]] && \
    [[ ! "$TERM" =~ tmux ]] && \
    [ -z "$TMUX" ]; then 
  tmux attach || tmux new-session
fi


# -- Environment Variables -----------------------------------------------------
export PATH=$PATH:/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:/mnt/c/Windows/SysWOW64/
export DOTFILES=$HOME/.dotfiles
export EDITOR=/usr/bin/nvim

# Ignore duplicates in bash history
export HISTCONTROL=ignoreboth:erasedups
# Increase bash history size
export HISTSIZE=10000
export HISTFILESIZE=10000

# -- Source Additional Files ---------------------------------------------------

source "$HOME/.cargo/env"

ALIASES=$HOME/.bash_aliases
if [[ -f $ALIASES ]]; then
    source "$ALIASES"
fi

# -- Run Startup Scripts -------------------------------------------------------

# Set up fzf key bindings and fuzzy completion
if command -v fzf &>/dev/null; then
    eval "$(fzf --bash)"
fi

# Launch the startship prompt
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi
. "$HOME/.cargo/env"
