#!/usr/bin/env bash

CATPPUCCIN_LAVENDER="\033[38;5;147m"
CATPPUCCIN_SAPPHIRE="\033[38;5;153m"
CATPPUCCIN_PEACH="\033[38;5;214m"
CATPPUCCIN_GRAY="\033[38;5;240m"
RESET_COLOR="\033[0m"

ZOXIDE_RESULT=$(zoxide query -l)
FIND_RESULT=$(find ~/.config ~/work ~/personal -maxdepth 1 -type d)

COMBINED_RESULT=$(echo -e "$ZOXIDE_RESULT\n$FIND_RESULT" | awk '!seen[$0]++' | sed "s|$HOME|~|")

COLORIZED_RESULT=$(echo "$COMBINED_RESULT" | while read -r line; do
    if [[ "$line" == *~/personal* ]]; then
        printf "${CATPPUCCIN_LAVENDER}%s${RESET_COLOR}\n" "$line"
    elif [[ "$line" == *~/work* ]]; then
        printf "${CATPPUCCIN_SAPPHIRE}%s${RESET_COLOR}\n" "$line"
    elif [[ "$line" == *~/.config* ]]; then
        printf "${CATPPUCCIN_PEACH}%s${RESET_COLOR}\n" "$line"
     else
        printf "${CATPPUCCIN_GRAY}%s${RESET_COLOR}\n" "$line"
    fi
done)

SELECTED_RESULT=$(echo -e "$COLORIZED_RESULT" | fzf --ansi)

if [ -z "$SELECTED_RESULT" ]; then
    exit 0
fi

SELECTED_RESULT_CLEAN=$(echo "$SELECTED_RESULT" | sed "s|\x1B\[[0-9;]*m||g")

FOLDER=$(basename "$SELECTED_RESULT_CLEAN" | tr . _)

SESSION=$(tmux list-sessions | grep $FOLDER | awk '{print $1}')

SELECTED_RESULT_CLEAN=$(echo "$SELECTED_RESULT_CLEAN" | sed "s|~|$HOME|")

if [ -z "$SESSION" ]; then
    tmux new-session -d -s $FOLDER -c "$SELECTED_RESULT_CLEAN/"
    # tmux new-window -c "$SELECTED_RESULT_CLEAN" -d -n shell
    tmux switch-client -t $FOLDER
else
    tmux switch-client -t $FOLDER
fi
