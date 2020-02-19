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
  chromium \
  code \
  docker \
  go \
  nodejs \
  rust \
  postgresql \
  zsh \
  zsh-completions \
  zsh-theme-powerlevel9k \
  powerline-fonts \
  awesome-terminal-fonts \
  otf-fira-code \
  vault \
  --noconfirm

# Utilities from AUR
yay -S \
  google-cloud-sdk  \
  kubectl  \
  kubectx  \
  slack-desktop  \
  teams  \
  bumblebee-status  \
  circleci-cli-bin \
  --noconfirm\

# Install Terraform and take ownership of /usr/local/bin
# sudo chown -R $USER /usr/local/bin
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash

# Install oh-my-zsh and plugins
pamac build nerd-fonts-complete --noconfirm
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggetions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggetions


# Install spotify
pamac build spotify --noconfirm


# Setup VS Code
code --install-extension ms-vscode.go
code --install-extension ms-python.python
code --install-extension esbenp.prettier-vscode
code --install-extension azemoh.one-monokai
code --install-extension vscode-icons-team.vscode-icons
code --install-extension rust-lang.rust
code --intsall-extension mauve.terraform
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ln -s $DIR/.compton.conf ~/.config/compton.conf
ln -s $DIR/.i3/config ~/.i3/config
ln -s $DIR/.Xresources ~/.Xresources
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.profile ~/.profile
ln -s $DIR/.bash_profile ~/.bash_profile
ln -s $DIR/.bashrc ~/.bashrc
ln -s $DIR/.zshrc ~/.zshrc
ln -s $DIR/.gitconfig ~/.gitconfig
ln -s $DIR/.ssh/config ~/.ssh/config