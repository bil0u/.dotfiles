#!/usr/bin/env bash

function filename {
    echo "🟠 $1"
}

function group {
    echo "📦 $1"
}

function prompt {
    echo "💬 $1"
}

function pad {
    echo -n "   "
}

function action {
    echo "🚀 $1"
}

function ignored {
    echo "✨ $1"
}

function error {
    echo "🛑 $1" >&2
}

# usage: command | scroller <offset> <nlines>
function scroller() {
    local offset nlines all i
    offset=${1:-0}
    nlines=${2:-10}
    i=0
    buffer=""

    tput cud "$offset" # move down cursor of $offset lines
    tput sc            # save cursor position
    tput civis         # make cursor invisible

    while IFS= read -r line; do
        tput rc                 # restore cursor position
        tput ed                 # clean from cursor to end of screen
        buffer="$buffer$line\n" # add line to buffer
        ((i++))                 # increment line count
        if [ "$i" -ge "$nlines" ]; then
            buffer="${buffer#*\n}" # if the line count is superior we trim the oldest line
        fi
        printf '%s' "$buffer" # and we display the buffer
    done

    tput rc            # restore cursor position
    tput cuu "$offset" # move up cursor of $offset lines
    tput ed            # clean from cursor to end of screen
    tput cnorm         # make cursor normal
}
