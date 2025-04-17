#!/usr/bin/env bash

EZA_DEFAULT_OPTIONS='-hl@'
alias ls='eza $EZA_DEFAULT_OPTIONS'
alias la='eza -a $EZA_DEFAULT_OPTIONS'
alias reload='source $HOME/.bashrc'


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
