#!/usr/bin/env -S bash -l

function err() {
    echo $@ >&2
}
export -f err
