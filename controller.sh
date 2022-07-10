#!/bin/bash

sens=2
displayWidth=$(xdotool getdisplaygeometry | awk '{ print $1 }')
displayHeight=$(xdotool getdisplaygeometry | awk '{ print $2 }')

while true; do
    eval $(xdotool getmouselocation --shell)

    if [[ $X -lt $((sens - 1)) && $Y -lt $((sens - 1)) ]]; then
        notify-send "top-left"
        sleep 1
    elif [[ $X -lt $((sens - 1)) && $Y -gt $((displayHeight - sens)) ]]; then
        notify-send "bottom-left"
        sleep 1
    elif [[ $X -gt $((displayWidth - sens)) && $Y -gt $((displayHeight - sens)) ]]; then
        notify-send "bottom-right"
        sleep 1
    elif [[ $X -gt $((displayWidth - sens)) && $Y -lt $((sens - 1)) ]]; then
        notify-send "top-right"
        sleep 1
    fi

    sleep 0.3
done
