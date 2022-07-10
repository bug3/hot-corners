#!/bin/bash

source config.conf

if [[ $# -eq 0 ]]; then
	install
elif [[ $1 == "-r" ]]; then
	uninstall
fi
