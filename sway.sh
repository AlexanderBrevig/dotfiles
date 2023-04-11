#!/bin/bash
paru -Syu
# Absolutely basics
paru -S base-devel coreutils cmake
# Terminal essentials
paru -S kitty fish starship
# Tool essentials
paru -S bat exa ripgrep stow tldr jq yq peco
paru -S google-chrome
# Applications
paru -S bitwarden bitwarden-cli 
# paru -S blender kicad kicad-library kicad-library-3d

stow kitty -t ~
stow git -t ~
stow fish -t ~
stow starship -t ~
stow helix -t ~

stow mako -t ~
stow wofi -t ~
stow mime -t ~

stow sway -t ~
stow swaylock -t ~

stow peco -t ~
stow helix -t ~
