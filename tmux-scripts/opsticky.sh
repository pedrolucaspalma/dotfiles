#!/bin/zsh                                                                                                   

SESSIONNAME="sticky"
    tmux new-session -d -s $SESSIONNAME

    # Running API on window 1
    tmux send-keys -t $SESSIONNAME:1 "cd ~/Developer/sticky/sticky-api" C-m 
    tmux rename-window -t sticky:1 "api-docker"
    tmux send-keys -t $SESSIONNAME:1 "dcu" C-m

    # Empty API window for git commands
    tmux new-window -t $SESSIONNAME:2 -n 'api-terminal'
    tmux send-keys -t $SESSIONNAME:2 "cd ~/Developer/sticky/sticky-api" C-m 
    tmux send-keys -t $SESSIONNAME:2 "code ." C-m 
    tmux send-keys -t $SESSIONNAME:2 "clear" C-m

    # Running Admin on window 3
    tmux new-window -t $SESSIONNAME:3 -n 'admin'
    tmux send-keys -t $SESSIONNAME:3 "cd ~/Developer/sticky/sticky-admin" C-m
    tmux send-keys -t $SESSIONNAME:3 "code ." C-m
    tmux send-keys -t $SESSIONNAME:3 "clear" C-m

    tmux split-window -h -t $SESSIONNAME:3
    tmux send-keys -t $SESSIONNAME:3.1 "yarn dev" C-m
    tmux send-keys -t $SESSIONNAME:3.2 "cd ~/Developer/sticky/sticky-admin" C-m
    tmux send-keys -t $SESSIONNAME:3.2 "clear" C-m

    # Running Community-API on window 4
    tmux new-window -t $SESSIONNAME:4 -n 'community-api'
    tmux send-keys -t $SESSIONNAME:4 "cd ~/Developer/sticky/sticky-community" C-m
    tmux send-keys -t $SESSIONNAME:4 "clear" C-m
    tmux split-window -h -t $SESSIONNAME:4

#    tmux send-keys -t $SESSIONNAME:4.1 "docker compose up" C-m
    tmux send-keys -t $SESSIONNAME:4.2 "cd ~/Developer/sticky/sticky-community" C-m
    tmux send-keys -t $SESSIONNAME:4.2 "clear" C-m
#    tmux send-keys -t $SESSIONNAME:4.2 "./nodebb dev" C-m

    tmux split-window -v -t $SESSIONNAME:4
    tmux send-keys -t $SESSIONNAME:4.3 "cd ~/Developer/sticky/sticky-community" C-m
#    tmux send-keys -t $SESSIONNAME:4.3 "code ." C-m
    tmux send-keys -t $SESSIONNAME:4.3 "clear" C-m

    # Opening notes on window 5
    tmux new-window -t $SESSIONNAME:5 -n 'notes'
    tmux send-keys -t $SESSIONNAME:5 "cd ~/Developer/sticky" C-m
    tmux send-keys -t $SESSIONNAME:5 "clear" C-m

tmux attach -t $SESSIONNAME
