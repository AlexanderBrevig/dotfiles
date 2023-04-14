#!/bin/bash
paru -Syu

grep --invert-match "#.*" pacman.lst | grep  . | xargs paru -S --needed --noconfirm

stow kitty -t ~
stow git -t ~
stow fish -t ~
stow starship -t ~
stow helix -t ~
stow peco -t ~
