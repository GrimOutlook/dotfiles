#!/usr/bin/env bash
function bkp() {
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
    new_filename_base="$filename.bkp"
    if ! $(echo "$filename" | grep -o "^\."); then
        new_filename_base=".$new_filename_base"
    fi
    new_path="$directory/$new_filename_base-$(date +'%F_%R:%S')"
    mv "$path" "$new_path" || {
        echo "Failed to bkp $path to $new_path" >&2
        return 1
    }

    echo "Backed up $path to $new_path"
}
