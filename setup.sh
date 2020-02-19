#!/bin/bash

read -p "SYstem Update? Y/n: " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    sudo pacman -Syu
fi

read -p "Install Pacman Packages? Y/n: " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
# Install tools and programming languages
sudo pacman -S \
  wget \
  curl \
  jq \
  yay \
  powerline-fonts \
  zsh \
  zsh-completions \
  chromium \
  code \
  docker \
  go \
  nodejs \
  rust \
  --noconfirm

# Utilities from AUR
yay -S google-cloud-sdk kubectl kubectx slack-desktop teams --noconfirm

# Install Terraform and take ownership of /usr/local/bin
# sudo chown -R $USER /usr/local/bin
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash

# Install oh-my-zsh and plugins
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggetions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggetions

# Setup VS Code
code --install-extension ms-vscode.go
code --install-extension ms-python.python
code --install-extension esbenp.prettier-vscode
code --install-extension azemoh.one-monokai
code --install-extension vscode-icons-team.vscode-icons
code --install-extension rust-lang.rust
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ln -s $DIR/.Xresources ~/.Xresources
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.profile ~/.profile
ln -s $DIR/.bash_profile ~/.bash_profile
ln -s $DIR/.bashrc ~/.bashrc
ln -s $DIR/.zshrc ~/.zshrc
ln -s $DIR/.gitconfig ~/.gitconfig