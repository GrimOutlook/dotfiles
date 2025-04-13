function help
    "$argv" --help 2>&1 | bat --plain --language=help
end

abbr -a --position anywhere -- --help '--help | bat -plhelp'
abbr -a --position anywhere -- -h '-h | bat -plhelp'