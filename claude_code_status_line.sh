#!/bin/bash

input=$(cat)

get() {
    echo "$input" | jq -r "$1"
}

bar() {
    local pct=$1
    local width=$2

    (( pct < 0 )) && pct=0
    (( pct > 100 )) && pct=100

    local filled=$(( pct * width / 100 ))
    local empty=$(( width - filled ))

    if (( filled > 0 )); then
        printf "\e[42m%0.s \e[0m" $(seq 1 $filled)
    fi

    if (( empty > 0 )); then
        printf "\e[48;5;22m%0.s \e[0m" $(seq 1 $empty)
    fi
}

# colors
RESET="\e[0m"

PURPLE="\e[38;5;183m"
BLUE="\e[38;5;111m"
GREEN="\e[38;5;48m"
GRAY="\e[38;5;245m"
RED="\e[38;5;203m"

MODEL=$(get '.model.display_name')
LINES_ADDED=$(get '.cost.total_lines_added // 0')
LINES_RM=$(get '.cost.total_lines_removed // 0')
EFFORT=$(get '.effort.level')
VIM_MODE=$(get '.vim.mode')

WINDOW=$(get '.context_window.context_window_size // 1')
INPUT=$(get '.context_window.total_input_tokens // 0')
OUTPUT=$(get '.context_window.total_output_tokens // 0')

USED=$(( INPUT + OUTPUT ))
PCT=$(( USED * 100 / WINDOW ))

BAR=$(bar "$PCT" 12)

BRANCH=$(git -C "$PWD" branch --show-current 2>/dev/null)
BRANCH=${BRANCH:-no_git}

EMAIL="<your-email>"

TOKENS="$(printf "%sk/%sk" $((USED/1000)) $((WINDOW/1000)))"

echo -e "${GRAY}${MODEL}${RESET} ${GRAY}|${RESET} ${PURPLE}effort: ${EFFORT}${RESET} ${GRAY}|${RESET} ${PURPLE} ${BRANCH}${RESET} ${GRAY}|${RESET} ${GREEN}+${LINES_ADDED} -${LINES_RM}${RESET}"

echo -e "${BLUE}${VIM_MODE}${RESET} ${GRAY}|${RESET} ${BAR} ${GREEN}${TOKENS} (${PCT}%)${RESET}"

echo -e "${RED}${EMAIL}${RESET}"
