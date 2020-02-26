#!/bin/bash

read -p "SYstem Update? y/N: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo pacman -Syyu
    echo "Please double check if you are asked to reboot."
fi

read -p "Install Tools? y/N: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
/bin/bash ./setup_tools.sh
fi

read -p "Install Applications? y/N: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
/bin/bash ./setup_apps.sh
/bin/bash ./setup_snap.sh
/bin/bash ./setup_vscode.sh
fi

/bin/bash ./symlink.sh