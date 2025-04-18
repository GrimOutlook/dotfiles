#!/usr/bin/env bash
function rst() {
    # TODO: Make this work when multiple paths are given
    if [ $# -gt 1 ]; then
        echo "More than one argument is currently not supported!" >&2
        return 1
    fi

    path=$1
    if [ ! -e $path ]; then
        echo "$path does not exist" >&2
        return 1
    fi

    filename="$(basename "$path")"
    directory="$(dirname "$path")"
    new_path="$directory/$(echo $filename | grep -Po '(?<=\.).+(?=.bkp)')"
    # Check if the new_path exists, if it does we will just run a bkp on it to
    # get it out of the way
    if [ -e "$new_path" ]; then
        bkp "$new_path"
    fi
    mv "$path" "$new_path" || {
        echo "Could not restore $path to $new_path" >&2
        return 1
    }

    echo "Restored $path to $new_path"
}
