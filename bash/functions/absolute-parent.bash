#!/usr/bin/env bash

function absolute-parent() {
    source=$1
    parent="$(dirname $source)"
    pushd $parent &>/dev/null || return 1
    absolute_path="$(pwd)"
    popd &>/dev/null || return 1
    echo "$absolute_path"
}
