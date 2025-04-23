function nvim-mkdir() {
    if [[ $# -ne 1 ]]; then
        return $(/usr/bin/nvim "$@")
    fi

    path=$1
    parent_dir="$(dirname $path)"
    if [[ ! -d "$parent_dir" ]]; then
        yes-no "$parent_dir doesn't exist. Would you like to create it?" || \
            return 1
    fi
    mkdir -p "$parent_dir"
    /usr/bin/nvim $path
}
export -f nvim-mkdir
alias v='nvim-mkdir'
alias vi='nvim-mkdir'
alias vim='nvim-mkdir'
alias nvim='nvim-mkdir'
