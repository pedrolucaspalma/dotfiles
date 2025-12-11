#!/bin/zsh                                                                                                   

SESSIONNAME="mwro"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]
 then
    tmux new-session -d -s $SESSIONNAME

    # Running API on window 1
    tmux send-keys -t $SESSIONNAME:1 "cd ~/Developer/mwro-ts" C-m 
    tmux send-keys -t $SESSIONNAME:1 "code ." C-m 
    tmux send-keys -t $SESSIONNAME:1 "clear" C-m

fi

tmux attach -t $SESSIONNAME
