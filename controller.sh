#!/bin/bash

source $(dirname $(realpath $0))/config.conf

cSize=$((cornerSize + 1))
displayWidth=$(xdotool getdisplaygeometry | awk '{ print $1 }')
displayHeight=$(xdotool getdisplaygeometry | awk '{ print $2 }')

while true; do
    eval $(xdotool getmouselocation --shell)

    if [[ $X -lt $((cSize - 1)) && $Y -lt $((cSize - 1)) ]]; then
        /bin/bash $appPath/corners/top-left.sh
        sleep $execDelay
    elif [[ $X -lt $((cSize - 1)) && $Y -gt $((displayHeight - cSize)) ]]; then
        /bin/bash $appPath/corners/bottom-left.sh
        sleep $execDelay
    elif [[ $X -gt $((displayWidth - cSize)) && $Y -gt $((displayHeight - cSize)) ]]; then
        /bin/bash $appPath/corners/bottom-right.sh
        sleep $execDelay
    elif [[ $X -gt $((displayWidth - cSize)) && $Y -lt $((cSize - 1)) ]]; then
        /bin/bash $appPath/corners/top-right.sh
        sleep $execDelay
    fi

    sleep $controlDelay
done
