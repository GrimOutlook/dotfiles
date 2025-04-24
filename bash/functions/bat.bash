function follow() {
    tail -f "$1" | bat --paging=never -l log
}

alias cat='bat'
