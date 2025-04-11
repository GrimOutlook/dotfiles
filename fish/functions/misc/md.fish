#!/usr/bin/env fish

function md
    echo "Creating directory [$argv]"
    mkdir -p "$argv" || {
        echo "Failed to create directory [$argv]"
        return 1
    }
    echo "Moving to directory [$argv]"
    cd "$argv" || {
        echo "Failed to move into directory [$argv]"
        return 1
    }
end