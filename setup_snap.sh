#!/bin/bash
if ! [ -x "$(command -v snap)" ]; then
    sudo snap install helm --classic
    sudo snap install teams-for-linux --classic
    sudo snap install slack --classic
    sudo snap install spotify --classic
    sudo snap install blender --classic
else
    echo "Snap not installed.\nSkipping setup_snap.sh"
fi