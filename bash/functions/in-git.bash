function in-git() {
    git rev-parse --is-inside-git-dir 2>&1 1>/dev/null || return 1
}
