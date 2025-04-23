function is-interactive() {
    [[ $- == *i* ]] || return 1
}
