#
# ~/.bashrc
#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#IBUS Stuff
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
# ibus-daemon -drx

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Color option for ls depending on if you are using linux or OSX
ls --color=al > /dev/null 2>&1 && alias ls='ls -F --color=al' || alias ls='ls -G'
LS_COLORS=$LS_COLORS:'ow=0;32:' ; export LS_COLORS

#Set up my history file to ignore duplicates and be much larger than the default
HISTCONTROL=ignoreboth:erasedups HISTSIZE=100000 HISTFILESIZE=200000

#Function "md" to make and cd into a directory with one command
md () { [ $# = 1 ] && mkdir -p "$@" && cd "$@" || echo "Error - no directory passed!"; }

# Improve PS1 Prompt
HOST='\033[02;36m\]\h'; HOST=' '$HOST
TIME='\033[01;31m\]\t \033[01;32m\]'
LOCATION=' \033[01;34m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g" `\033[0m\]\n\$ '
USER="dom"
PS1=$TIME$USER$HOST$LOCATION
#PS1='[\u@\h \W]\$ '

# Improved PS2 Prompt
PS2='\[\033[01;36m\]>'

# Set default editor to vim
export EDITOR=vim

#set -o vi # vi at command line

#export TERM=xterm-256color

bind 'set mark-symlinked-directories on' # Makes symlinked directories autocomplete as directories

test -s ~/.autojump/etc/profile.d/autojump && . $_ # Execute autojump if it exists

[ ${BASH_VERSINFO[0]} -ge 4 ] && shopt -s autocd # Allow cd'ing without typing the cd part if the bash version >= 4

[ -f /etc/bash_completion  ] && ! shopt -oq posix && . /etc/bash_completion # Execute a bash completion script if it exists

[ $HOSTNAME == "ArchDesktop" -o $HOSTNAME == "LubuntuLaptop" ] && [ -z $TMUX ] && export TERM=xterm-256color && exec tmux # Use TMUX if it is present

# Avoid succesive duplicates in the bash command history.
export HISTCONTROL=ignoredups

# Append commands to the bash command history file (~/.bash_history)
# instead of overwriting it.
shopt -s histappend

# Append commands to the history every time a prompt is shown,
# instead of after closing the session.
PROMPT_COMMAND='history -a'

# Add bash aliases.
[ -f /etc/config/home/bash_aliases ] && source /etc/config/home/bash_aliases

function cs () {
    cd "$@" && ls
}

function secure_chromium {
    port=8080
    chromium --proxy-server="socks://localhost:$port" &
}

function BOTW
{
    WINEDEBUG=fps wine "/home/dom/Games/The Legend of Zelda - Breath of the Wild (PC)/cemu_1.11.3/Cemu.exe" 2>&1 | tee /dev/stderr | sed -u -n -e '/trace/ s/.*approx //p' | osd_cat --lines=1 --font="lucidasanstypewriter-bold-18" --color=yellow -o 2175
}
