#!/usr/bin/env bash

function mklink() {
    if [ ! $# -eq 2 ]; then
        echo "Only 2 arguments allowed when calling mklink" >&2
        return 1
    fi

    source=$1

    destination=$2
    if [ -f "$destination" ]; then
        bkp "$destination" || return 1
    fi

    destination_directory="$(dirname "$destination")"
    if [ ! -d "$destination_directory" ]; then
        mkdir -p "$destination_directory" || {
            echo "Failed to create directory"
            return 1
        }
    fi

    ln -s "$source" "$destination" || {
        echo "Failed to link $source to $destination" >&2
        return 1
    }
}
