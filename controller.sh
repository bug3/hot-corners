#!/bin/bash

source $(dirname $(realpath $0))/config.conf

sens=2
displayWidth=$(xdotool getdisplaygeometry | awk '{ print $1 }')
displayHeight=$(xdotool getdisplaygeometry | awk '{ print $2 }')

while true; do
    eval $(xdotool getmouselocation --shell)

    if [[ $X -lt $((sens - 1)) && $Y -lt $((sens - 1)) ]]; then
        /bin/bash $appPath/corners/top-left.sh
        sleep 1
    elif [[ $X -lt $((sens - 1)) && $Y -gt $((displayHeight - sens)) ]]; then
        /bin/bash $appPath/corners/bottom-left.sh
        sleep 1
    elif [[ $X -gt $((displayWidth - sens)) && $Y -gt $((displayHeight - sens)) ]]; then
        /bin/bash $appPath/corners/bottom-right.sh
        sleep 1
    elif [[ $X -gt $((displayWidth - sens)) && $Y -lt $((sens - 1)) ]]; then
        /bin/bash $appPath/corners/top-right.sh
        sleep 1
    fi

    sleep 0.3
done
