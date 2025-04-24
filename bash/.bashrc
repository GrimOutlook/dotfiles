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
    tmux new-session
fi


# -- Environment Variables -----------------------------------------------------
# export PATH=$PATH:/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:/mnt/c/Windows/SysWOW64/
export DOTFILES=$HOME/.dotfiles
export CONFIG=$HOME/.config

export EDITOR=/usr/bin/nvim
# Prevent go from creating a `go/` directory in the middle of your home
# directory.
export GOPATH=$HOME/.go

# Ignore duplicates in bash history
export HISTCONTROL=ignoreboth:erasedups
# Increase bash history size
export HISTSIZE=10000
export HISTFILESIZE=10000

# Color manpage output with bat
if command -v bat &>/dev/null; then
    export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
else
    echo "bat is not installed" >&2
fi

# -- Source Additional Files ---------------------------------------------------

ALIASES=$HOME/.bash_aliases
if [[ -f $ALIASES ]]; then
    source "$ALIASES"
fi

COMPLETIONS=$HOME/.bash_completions/
completions=$(fd -type f "$COMPLETIONS")
for file in $completions; do
    source "$file"
done

source "$HOME/.cargo/env" &>/dev/null

# -- Run Startup Scripts -------------------------------------------------------

# Set up fzf key bindings and fuzzy completion
if command -v fzf &>/dev/null; then
    eval "$(fzf --bash)"
else
    echo "fzf is not installed" >&2
fi

# Launch the startship prompt
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
else
    echo "starship is not installed" >&2
fi

if command -v thefuck &>/dev/null; then
    eval "$(thefuck --alias)"
else
    echo "fzf is not installed" >&2
fi
