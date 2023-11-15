#!/bin/bash

vim_options="$@"

# tmux session name determination
WINDOW_NAME="win"
SESH_PREFIX="sesh"
SESH_NUM=0
VALID=0
while [ $VALID == 0 ]; do
    SESH_NAME="$SESH_PREFIX$SESH_NUM"
    tmux has-session -t $SESH_NAME
    if [ $? == 0 ] 
     then
        ((SESH_NUM++))
     else
        VALID=1
    fi
done

echo "Launching $SESH_NAME"

vim_options="$vim_options -c 'let cellmode_tmux_sessionname=\"$SESH_NAME\"'"
vim_options="$vim_options -c 'let cellmode_use_tmux=1'"
vim_options="$vim_options -c 'let cellmode_tmux_panenumber=1'"
vim_options="$vim_options -c 'let cellmode_tmux_windowname=\"$WINDOW_NAME\"'"
#vim_options="$vim_options -c 'source ~/.custom/resources/vim/tslime.vim'" # old tslime-based version

tmux new-session -d -s $SESH_NAME
tmux rename-window $WINDOW_NAME

# fix pasteboard issue, see https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard and my notes
dir0=`pwd`
tmux send-keys "reattach-to-user-namespace -l zsh"
tmux send-keys "source ~/.bash_profile" Enter
tmux send-keys "cd $dir0 && clear" Enter

# launch vim
tmux send-keys -t $SESH_NAME "vim ${vim_options}" Enter

#tmux split-window -h 'ipython' #if you want exiting ipython to close the pane
tmux split-window -h #if you don't want exiting ipython to close the pane (1/2)
tmux send-keys 'reattach-to-user-namespace -l zsh' Enter  # fix for pasteboard bug part 1
tmux send-keys 'source ~/.bash_profile' Enter  # fix for pasteboard bug part 2
tmux send-keys "cd $dir0 && clear" Enter
tmux send-keys 'ipython' Enter #if you don't want exiting ipython to close the pane (2/2)
tmux select-pane -t 0
#tmux send-keys 'i'
tmux attach-session -t $SESH_NAME
