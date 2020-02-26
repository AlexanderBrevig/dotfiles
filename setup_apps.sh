#!/bin/bash
sudo pacman -S \
  chromium \
  otf-fira-code \
  --noconfirm
  --needed

sudo pacman -S snapd --noconfirm
sudo systemctl enable --now snapd.socket
sudo systemctl start --now snapd.socket

# Utilities from AUR
yay -S \
  bumblebee-status  \
  nerd-fonts-complete \
  --noconfirm
  --needed

echo "Install Zsh, oh-my-zsh and some plugins"
sudo pacman -S \
  zsh \
  zsh-completions \
  zsh-theme-powerlevel9k \
  --noconfirm
  --needed
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
