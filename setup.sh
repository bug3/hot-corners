#!/bin/bash

source config.conf

install() {
    if [[ ! -e $appPath ]]; then
        sudo mkdir $appPath
    else
        echo "$appPath already exists"
        exit 1
    fi

    desktop-file-edit --set-key="Exec" --set-value=$appPath/controller.sh hot-corners.desktop
    
    sudo cp -r * $appPath
    sudo ln -s $appPath$binFile $binFile
    
    sudo chmod +x $appPath$binFile
    sudo chmod -R 777 $appPath/corners/*
}

uninstall() {
    sudo rm -r $appPath
    sudo rm $binFile
}

if [[ $# -eq 0 ]]; then
    install
elif [[ $1 == "-r" ]]; then
    uninstall
fi
