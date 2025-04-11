#!/usr/bin/env fish

set SCRIPT_DIR (cd (dirname (status -f)); and pwd)

# Install TMUX config
mv /home/$USER/.config/tmux /home/$USER/.config/.tmux.old
ln -s $SCRIPT_DIR/tmux /home/$USER/.config/tmux

# Install fish files
mv /home/$USER/.config/fish /home/$USER/.config/.fish.old
ln -s $SCRIPT_DIR/fish /home/$USER/.config/fish

# Install bash files
mv /home/$USER/.bashrc /home/$USER/.bashrc.old
ln -s $SCRIPT_DIR/bash/.bashrc /home/$USER/.bashrc
