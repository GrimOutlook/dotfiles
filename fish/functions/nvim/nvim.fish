function nvim
    if test -d "$argv"
        echo "Refusing to open directory in neovim" >&2
        return 1
    end
    /usr/bin/mkdir -p (/usr/bin/dirname "$argv")
    /usr/bin/nvim "$argv"
end