#!/usr/bin/env bash

function git() {
    GIT="$(which git)"
    if [ ! $? ]; then
        err "git is not installed."
        return 1
    fi

    in-git || {
        err "Not in git repo."
        return 1
    }

    # Changing the config is the only thing allowed when the system or global
    # gitconfig contain any author information or if the local gitconfig don't
    # contain any author information.
    if [[ $(echo "$@" | rg "^config") ]]; then
        $GIT "$@"
        return $?
    fi

    # Check that author information is not set in the global or system's git
    # config.
    any-author-check "/etc/gitconfig" && {
        err "System gitconfig contains author information."
        return 1
    }
    any-author-check "$HOME/.gitconfig" && {
        err "Global gitconfig contains author information."
        return 1
    }

    # Check that author information is set in the repo we're trying to run in.
    all-author-check "$(git-root)/.git/config" || {
        err "Local gitconfig doesn't contain author information."
        return 1
    }

    # Check if the arguments passed in try to set the global or system config's
    # author information.
    check-args-for-global $@ || return 1

    $GIT "$@"
}

function any-author-check() {
    config_file="$1"
    user_section="$(user-section $config_file)"
    test $? || return 0

    echo "$user_section" | rg 'name' &>/dev/null && return 1
    echo "$user_section" | rg 'email' &>/dev/null && return 1
}

function all-author-check() {
    config_file="$1"
    user_section="$(user-section $config_file)"
    test $? || return 1

    echo "$user_section" | rg 'name' &>/dev/null && \
    echo "$user_section" | rg 'email' &>/dev/null || return 1
}

function user-section() {
    config_file="$1"
    if ! test -f "$config_file"; then
        return 1
    fi
    rg -PU '\[user\](?s).*?((?=\[)|.*$)' $config_file
}

function check-args-for-global() {
    echo "$@" | rg -- '--global' &>/dev/null && \
    echo "$@" | rg 'user\.(name|email)' &>/dev/null && return 1
    return 0
}

function add-all() {
    in-git || {
        err "Not in a git repository."
        return 1
    }

    git add -A || {
        err "Failed to add all files to staging."
        return 1
    }

    git status --short
}

function commit-all() {
    in-git || {
        err "Not in a git repository."
        return 1
    }

    # This syntax allows for the user to not have to use quotes when making
    # a commit message.
    if [ ! $# -gt 0 ]; then
        err "No commit message provided."
        return 1
    fi

    commit_message="$@"
    git commit -m "$commit_message" || {
        err "Failed to commit to repo."
        return 1
    }
}

function push-all() {
    in-git || {
        err "Not in a git repository."
        return 1
    }

    commit-all $@ || return 1
    git push -u origin || {
        err "Failed to push to remote."
        return 1
    }
}

alias ca='commit-all'
alias pa='push-all'
alias aa='add-all'
alias st='git status --short'
alias ig='git check-ignore -v -- **/*'

