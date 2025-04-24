function git-root() {
    ( # Run in subshell
        if [ -d '.git' ]; then
            echo "$(pwd)"
            return 0
        fi
        
        if [ "$(pwd)" == "/" ]; then
            return 1
        else
            cd .. || return 1
            in-git
            return $?
        fi
    )
}
