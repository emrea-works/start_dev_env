#!/bin/bash
# This file must locaed in a folder that has app folder next to it
SESSION_NAME="session_name"
BASE_PATH=$(pwd)
FRONTEND_APP_PATH="$BASE_PATH/app/frontend"
DATABASE_APP_PATH="$BASE_PATH/database_project_folder"
CONTRACT_TESTS_PATH="$BASE_PATH/app"
COMMAND_LEFT_TOP=""
COMMAND_RIGHT_TOP=""
COMMAND_RIGHT_BOTTOM=""
COMMAND_LEFT_BOTTOM=""

# Start tmux
tmux new-session -d -s $SESSION_NAME

# 0.0 Left Top
tmux send-keys -t $SESSION_NAME:0.0 "cd $FRONTEND_APP_PATH" C-m
tmux send-keys -t $SESSION_NAME:0.0 "$COMMAND_LEFT_TOP" C-m

# 0.1 Right Top
tmux split-window -h -t $SESSION_NAME:0.0
tmux send-keys -t $SESSION_NAME:0.1 "cd $DATABASE_APP_PATH" C-m
tmux send-keys -t $SESSION_NAME:0.1 "$COMMAND_RIGHT_TOP" C-m

# 0.2 Right Bottom
tmux split-window -v -t $SESSION_NAME:0.1
tmux send-keys -t $SESSION_NAME:0.2 "cd $CONTRACT_TESTS_PATH" C-m
tmux send-keys -t $SESSION_NAME:0.2 "$COMMAND_RIGHT_BOTTOM" C-m
tmux resize-pane -D 10

# *.* Left Bottom
tmux split-window -v -t $SESSION_NAME:0.0
tmux send-keys -t $SESSION_NAME:0.1 "$COMMAND_LEFT_BOTTOM" C-m
tmux resize-pane -D 10

# Attach to the tmux session to see the output
tmux attach-session -t $SESSION_NAME
