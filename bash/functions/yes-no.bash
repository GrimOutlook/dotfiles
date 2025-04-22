#!/usr/bin/env bash
function yes-no() {
    PROMPT=$1
    while true; do
        read -n 1 -p "$PROMPT (y/N): " answer
        case ${answer:0:1} in
            y|Y )
                return 0
            ;;
            * )
                return 1
            ;;
        esac
    done
}
