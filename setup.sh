#!/bin/bash

read -p "SYstem Update? Y/n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo pacman -Syu
fi

read -p "Install Pacman Packages? Y/n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
# Install tools and programming languages
sudo pacman -S \
  wget \
  curl \
  jq \
  yay \
  chromium \
  docker \
  go \
  nodejs \
  npm \
  rust \
  postgresql \
  zsh \
  zsh-completions \
  zsh-theme-powerlevel9k \
  powerline-fonts \
  awesome-terminal-fonts \
  otf-fira-code \
  vault \
  snapd \
  --noconfirm

sudo systemctl enable --now snapd.socket

# Utilities from AUR
yay -S \
  google-cloud-sdk  \
  kubectl  \
  kubectx  \
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

## TODO: should be done after a reboot, how fix?
snap install helm --classic
snap install teams-for-linux
snap install slack --classic
snap install code --classic
code --install-extension eg2.tslint
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.go
code --install-extension ms-python.python
code --install-extension esbenp.prettier-vscode
code --install-extension azemoh.one-monokai
code --install-extension robertohuertasm.vscode-icons
code --install-extension rust-lang.rust
code --install-extension mauve.terraform

# Install spotify
pamac build spotify --noconfirm
fi

symlink_config()
{
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
  FILE=$1
  echo "removing $FILE and symlinking from $DIR"
  rm ~/$FILE
  ln -s $DIR/$FILE ~/$FILE
}

symlink_config .config/compton.conf
symlink_config .i3/config
symlink_config .Xresources
symlink_config .vimrc
symlink_config .profile
symlink_config .bash_profile
symlink_config .bashrc
symlink_config .zshrc
symlink_config .gitconfig
symlink_config .ssh/config
symlink_config .config/Code/User/settings.json
