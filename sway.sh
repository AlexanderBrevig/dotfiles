#!/bin/bash
yay -Syu
# Absolutely basics
yay -S base-devel coreutils cmake
# Terminal essentials
yay -S alacritty kitty neovim fish fish-fzf fish-z-git
# Tool essentials
yay -S bat exa ripgrep stow tldr jq peco
# Browsers
yay -S firefox firefox-ublock-origin chromium google-chrome
# Theme
yay -S gruvbox-dark-gtk gruvbox-dark-icons-gtk
# Applications
yay -S emacs-git
yay -S bitwarden bitwarden-cli blender kicad kicad-library kicad-library-3d mattermost mattermost-desktop

stow sway -t ~
stow waybar -t ~
stow kitty -t ~
stow fish -t ~
stow starship -t ~
stow nvim -t ~
stow git -t ~
stow doom -t ~
stow peco -t ~
stow helix -t ~
stow elvish -t ~