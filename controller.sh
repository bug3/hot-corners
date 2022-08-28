#!/bin/bash

source $(dirname $(realpath $0))/config.conf

lastCorner="none"
cSize=$((cornerSize + 1))

execCornerScript() {
    if [[ $lastCorner != $1 ]]; then
        lastCorner=$1
        /bin/bash $appPath/corners/$1.sh
    fi
}

while true; do
    dimensions=$(xdotool getdisplaygeometry)
    displayWidth=$(echo $dimensions | awk '{ print $1 }')
    displayHeight=$(echo $dimensions | awk '{ print $2 }')

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

    sleep 0.3
done
