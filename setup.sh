#!/bin/bash

source config.conf

editServiceFile() {
    sed -i "s|ExecStart=.*|ExecStart=$appPath/controller.sh|" $serviceFile
    sed -i "s|DISPLAY=|DISPLAY=$DISPLAY|" $serviceFile
    sed -i "s|XAUTHORITY=|XAUTHORITY=$XAUTHORITY|" $serviceFile
}

install() {
    if [[ ! -e $appPath ]]; then
        sudo mkdir $appPath
    else
        echo "$appPath already exists"
        exit 1
    fi

    editServiceFile

    sudo cp $serviceFile /etc/systemd/system
    sudo cp -r * $appPath
    sudo ln -s $appPath$binFile $binFile

    sudo chmod +x $appPath$binFile $appPath/controller.sh
    sudo chmod -R 777 $appPath/corners/*

    sudo systemctl daemon-reload
    sudo systemctl enable hot-corners.service
    sudo systemctl start hot-corners.service
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
