#!/bin/bash
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
  otf-fira-code \
  --noconfirm \
  --needed

# Utilities from AUR
yay -S \
  google-cloud-sdk  \
  kubectl  \
  kubectx  \
  bumblebee-status  \
  circleci-cli-bin \
  tflint \
  nerd-fonts-complete \
  --noconfirm \
  --needed

if ! [ -x "$(command -v tfswitch)" ]; then
    sudo chown -R $USER /usr/local/bin #yeah, I know...
    curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash
fi