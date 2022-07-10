#!/bin/bash

sens=2
displayWidth=$(xdotool getdisplaygeometry | awk '{ print $1 }')
displayHeight=$(xdotool getdisplaygeometry | awk '{ print $2 }')
