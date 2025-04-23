#!/usr/bin/env bash

function mklink() {
    if [ ! $# -eq 2 ]; then
        echo "Only 2 arguments allowed when calling mklink" >&2
        return 1
    fi

    SED="$(which sed)" || {
        echo "sed is not installed" >&2
        return 1
    }


    source=$(echo "$1" | $SED 's/\/$//')
    destination=$(echo "$2" | $SED 's/\/$//')
    
    if [ ! -e "$source" ]; then
        echo "$source is does not exist" >&2
        return 1
    fi

    if [ -e "$destination" ]; then
        bkp "$destination" || return 1
    elif [ -L "$destination" ]; then
        unlink "$destination" || return 1
    fi

    if [ -d "$destination" ]; then
        destination_directory="$destination"
    else
        destination_directory="$(dirname "$destination")"
        if [ ! -d "$destination_directory" ]; then
            mkdir -p "$destination_directory" || {
                echo "Failed to create directory"
                return 1
            }
        fi
    fi

    ln -s "$source" "$destination" || {
        echo "Failed to link $source to $destination" >&2
        return 1
    }
}
