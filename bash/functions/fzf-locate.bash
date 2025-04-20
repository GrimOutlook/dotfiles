# fzf-locate
TMUX_FZF_INTERNAL_COMMAND='tmux send-keys -t \#{pane_id} "$(locate / | fzf -m | paste -sd\\  -)"'
TMUX_FZF_COMMAND='tmux split-window -p 40 "$TMUX_FZF_INTERNAL_COMMAND"'
bind '"\e`": $TMUX_FZF_COMMAND'
