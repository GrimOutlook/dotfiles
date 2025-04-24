function in-git() {
    ( # Run in subshell
        git-root &>/dev/null
    )
}
export -f in-git
