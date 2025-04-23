#!/usr/bin/env -S bash -l

function fix-scripts() {
    scripts_dir="$1"
    function_scripts=$(rg --files-with-matches '^function ' "$scripts_dir")
    
    for function_script in $function_scripts; do
        # Get the name of the functions in the script
        functions="$(rg -oP '(?<=^function ).*(?=\W*\()' "$function_script")"
        for func in $functions;do
            # Find the end of the function
            close_bracket_line_number=$(
                rg -PUn "^function\W+$func.*\{(?s).*\}" "$function_script" |\
                    tail -n 1 | \
                    cut -d : -f 1\
                )
            # Append the line `export -f [FUNCTION_NAME]`
            next_line=$(($close_bracket_line_number + 1))
            /usr/bin/sed -i "${next_line}i export -f $func" "$function_script"
        done
    done
}
