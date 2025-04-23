function follow() {
    tail -f "$1" | bat --paging=never -l log
}
export -f follow

alias cat='bat'
