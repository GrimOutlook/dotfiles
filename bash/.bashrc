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

# Add the ble.sh functionality. Needs to be towards the top.
source "$HOME/.local/share/blesh/ble.sh" \
    --noattach \
    --rcfile "$HOME/.config/ble/blerc"

# ---------------------------------------------------------------------------- #
# -- Bash Options ------------------------------------------------------------ #
# ---------------------------------------------------------------------------- #
# Run the 'cd' command when typing only a path into the prompt
shopt -s autocd

# Append history entries.
shopt -s histappend

# ---------------------------------------------------------------------------- #
# -- Environment Variables --------------------------------------------------- #
# ---------------------------------------------------------------------------- #
export DOTFILES=$HOME/.dotfiles
export CONFIG=$HOME/.config
export PATH+=":$DOTFILES/bash/scripts/"

export EDITOR=/usr/bin/nvim
# Prevent go from creating a `go/` directory in the middle of your home
# directory.
export GOPATH=$HOME/.go

# -- History ----------------------------------------------------------------- #
# Ignore duplicates in bash history
export HISTCONTROL=ignoreboth
# Increase bash history size
export HISTSIZE=10000
export HISTFILESIZE=10000

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# -- Java -------------------------------------------------------------------- #
export JAVA_HOME=/usr/lib/jvm/default/

# -- Zoxide ------------------------------------------------------------------ #
export _ZO_ECHO=1

# Color manpage output with bat
if command -v bat &>/dev/null; then
    export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
else
    echo "bat is not installed" >&2
fi

# ---------------------------------------------------------------------------- #
# -- Source Additional Files ------------------------------------------------- #
# ---------------------------------------------------------------------------- #

ALIASES=$HOME/.bash_aliases
if [[ -f $ALIASES ]]; then
    source "$ALIASES"
fi

source "$HOME/.cargo/env" &>/dev/null

# Add hook for finding matching command if it doesn't exist
source "/usr/share/doc/pkgfile/command-not-found.bash"

# -- Run Startup Scripts -------------------------------------------------------

function eval-if-available() {
    full_command="$1"

    command="$(echo "$full_command" | cut -d ' ' -f 1)"
    if command -v "$command" &>/dev/null; then
        eval 'eval "$($full_command)"'
    else
        echo "$command is not installed" >&2
    fi
}

# Set up fzf key bindings and fuzzy completion
eval-if-available "fzf --bash"

# Launch the startship prompt
eval-if-available "starship init bash"

# Easy reruns after typo
eval-if-available "thefuck --alias"

# Jump to directories smartly
eval-if-available "zoxide init bash --cmd cd"

# Please put the following line in the end of .bashrc
[[ ! ${BLE_VERSION-} ]] || ble-attach
