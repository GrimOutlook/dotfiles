# Add function subdirs to fish_function_path
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path

# Add completion subdirs to fish_completion_path
set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path

# Make nvim the default editor
set -gx EDITOR "/usr/bin/nvim"
set -gx SYSTEMD_EDITOR "/usr/bin/nvim"

if status is-interactive
    # Commands to run in interactive sessions can go here
end
