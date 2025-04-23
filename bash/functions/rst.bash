export -f rst
#!/usr/bin/env bash
export -f rst
function rst() {
export -f rst
    # TODO: Make this work when multiple paths are given
export -f rst
    if [ ! $# -eq 1 ]; then
export -f rst
        echo "More than one argument is currently not supported!" >&2
export -f rst
        return 1
export -f rst
    fi
export -f rst

export -f rst
    path=$1
export -f rst
    if [ ! -e $path ]; then
export -f rst
        echo "$path does not exist" >&2
export -f rst
        return 1
export -f rst
    fi
export -f rst

export -f rst
    filename="$(basename "$path")"
export -f rst
    directory="$(dirname "$path")"
export -f rst
    new_path="$directory/$(echo $filename | grep -Po '(?<=\.).+(?=.bkp)')"
export -f rst
    # Check if the new_path exists, if it does we will just run a bkp on it to
export -f rst
    # get it out of the way
export -f rst
    if [ -e "$new_path" ]; then
export -f rst
        bkp "$new_path"
export -f rst
    fi
export -f rst
    mv "$path" "$new_path" || {
export -f rst
        echo "Could not restore $path to $new_path" >&2
export -f rst
        return 1
export -f rst
    }
export -f rst

export -f rst
    echo "Restored $path to $new_path"
export -f rst
}
