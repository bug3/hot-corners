#!/bin/bash

source $(dirname $(realpath $0))/config.conf

lastCorner="none"
cSize=$((cornerSize + 1))
displayWidth=$(xdotool getdisplaygeometry | awk '{ print $1 }')
displayHeight=$(xdotool getdisplaygeometry | awk '{ print $2 }')
processCount=$(ps aux | grep $(realpath $0) | wc -l)

if [[ $processCount -gt 3 ]]; then
    exit 0
fi

execCornerScript() {
    if [[ $lastCorner != $1 ]]; then
        lastCorner=$1
        /bin/bash $appPath/corners/$1.sh
    fi
}

while true; do
    eval $(xdotool getmouselocation --shell)

    if [[ $X -lt $((cSize - 1)) && $Y -lt $((cSize - 1)) ]]; then
        execCornerScript "top-left"
    elif [[ $X -lt $((cSize - 1)) && $Y -gt $((displayHeight - cSize)) ]]; then
        execCornerScript "bottom-left"
    elif [[ $X -gt $((displayWidth - cSize)) && $Y -gt $((displayHeight - cSize)) ]]; then
        execCornerScript "bottom-right"
    elif [[ $X -gt $((displayWidth - cSize)) && $Y -lt $((cSize - 1)) ]]; then
        execCornerScript "top-right"
    else
        lastCorner="none"
    fi

    sudo cat /dev/input/mice | :
done
