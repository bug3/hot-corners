#!/bin/bash

source config.conf

killPids() {
    pids=$(ps aux | grep $appPath/controller.sh | grep -v grep | awk '{print $2}')
    echo $pids | uniq | grep -o '[0-9]\+' | xargs kill
}

install() {
    if [[ ! -e $appPath ]]; then
        sudo mkdir $appPath
    else
        echo "$appPath already exists"
        exit 1
    fi

    desktop-file-edit --set-key="Exec" --set-value=$appPath/controller.sh hot-corners.desktop

    sudo cp hot-corners.desktop /etc/xdg/autostart
    sudo cp -r * $appPath
    sudo ln -s $appPath$binFile $binFile

    sudo chmod +x $appPath$binFile $appPath/controller.sh
    sudo chmod -R 777 $appPath/corners/*

    $appPath/controller.sh &
    disown
}

uninstall() {
    sudo rm -r $appPath
    sudo rm $binFile
    sudo rm /etc/xdg/autostart/hot-corners.desktop

    killPids
}

if [[ $# -eq 0 ]]; then
    install
elif [[ $1 == "-r" ]]; then
    uninstall
fi
