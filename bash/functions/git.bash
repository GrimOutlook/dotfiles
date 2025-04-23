function add-all() {
    in-git || {
        echo "Not in a git repository" >&2
        return 1
    }

    git add -A || {
        echo "Failed to add all files to staging" >&2
        return 1
    }

    git status --short
}
function commit-all() {
    in-git || {
        echo "Not in a git repository" >&2
        return 1
    }

    # This syntax allows for the user to not have to use quotes when making
    # a commit message.
    if [ ! $# -gt 0 ]; then
        echo "No commit message provided." >&2
        return 1
    fi

    commit_message="$@"
    git commit -m "$commit_message" || {
        echo "Failed to commit to repo." >&2
        return 1
    }
}
function push-all() {
    in-git || {
        echo "Not in a git repository" >&2
        return 1
    }

    commit-all $@ || return 1
    git push -u origin || {
        echo "Failed to push to remote." >&2
        return 1
    }
}
export -f push-all
export -f commit-all
export -f add-all

alias ca='commit-all'
alias pa='push-all'
alias aa='add-all'
alias st='git status --short'

