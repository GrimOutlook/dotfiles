function is-root() {
    [[ $EUID -eq 0 ]] || return 1
}
