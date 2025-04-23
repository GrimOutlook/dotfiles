#!/usr/bin/env -S bash -l

function fix-scripts() {
    scripts_dir="$1"
    function_scripts=$(rg --files-with-matches '^function ' "$scripts_dir")
    
    for function_script in $function_scripts; do
        # Get the number of lines in the file
        # This gets used later when determining if we need to use the sed
        # or echo command
        lines_in_file=$(wc -l $function_script)

        # Get the name of the functions in the script
        functions="$(rg -oP '(?<=^function ).*(?=\W*\()' "$function_script")"
        for func in $functions;do
            # Find the end of the function
            close_bracket_line_number=$(
                rg -PUn "^function\W+$func.*\{(?s).*?^\}" "$function_script" |\
                    tail -n 1 | \
                    cut -d : -f 1\
                )
            # Append the line `export -f [FUNCTION_NAME]`
            export_line="export -f $func"
            if rg -o "^$export_line" &>/dev/null; then
                echo "$func is already exported from $function_script"
                continue
            fi
            next_line=$(($close_bracket_line_number + 1))

            if [ $lines_in_file -ge $next_line ]; then
                /usr/bin/sed -i "${next_line}i $export_line" "$function_script" 
            else
                echo "$export_line" >> "$function_script"
            fi

            if [ $? ]; then
                echo "Failed to add export for $func in $function_script" >&2
                return 1
            fi
            echo "Added export for $func in $function_script"
        done
    done
}
export -f fix-scripts
