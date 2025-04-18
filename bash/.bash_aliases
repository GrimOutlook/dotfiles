#!/usr/bin/env bash

alias bashrc="$EDITOR $HOME/.bashrc"
alias bash_aliases="$EDITOR $HOME/.bash_aliases"

EZA_DEFAULT_OPTIONS='-hl@'
alias ls='eza $EZA_DEFAULT_OPTIONS'
alias la='eza -a $EZA_DEFAULT_OPTIONS'
alias reload='source $HOME/.bashrc'

alias cat='bat --color=always'
alias cp="xcp"
alias j="just"

# Git
alias st="git status --short"
function push-all() {
    if [ ! $# -gt 0 ]; then
        echo "No commit message provided, not continuing"
    fi

    commit_message="'$@'"
    git commit -a -m "$commit_message" || {
        echo "Failed to commit to repo" >&2
        return 1;
    }
    git push -u origin || {
        echo "Failed to push to remote" >&2
        return 1
    }
}
alias pa="push-all"


function nvim-mkdir() {
    if [[ $# -gt 1 ]]; then
        return $(nvim "$@")
    fi
    path=$1
    if [[ ! -e $path ]]; then
        echo "Path [$path] doesn't exist. Would you like to create it?"
        return 1
    fi
    mkdir -p "$(dirname $path)"
    nvim $path
}
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias nvim='nvim'

# fzf-locate
TMUX_FZF_INTERNAL_COMMAND='tmux send-keys -t \#{pane_id} "$(locate / | fzf -m | paste -sd\\  -)"'
TMUX_FZF_COMMAND='tmux split-window -p 40 "$TMUX_FZF_INTERNAL_COMMAND"'
bind '"\e`": $TMUX_FZF_COMMAND'

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for\!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}
