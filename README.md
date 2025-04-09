# .dotfiles

## Todo:

- Make batcat the default pager for all programs
- Make batcat the default pager for man pages

#Function "md" to make and cd into a directory with one command md () { [ $# = 1
] && mkdir -p "$@" && cd "$@" || echo "Error - no directory passed!"; }