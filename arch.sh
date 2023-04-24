#!/usr/bin/env bash
paru -Syu
paru -S --needed base-devel openssh git stow gnupg

stow git -t ~
stow fish -t ~
stow kitty -t ~
stow starship -t ~
stow helix -t ~
stow peco -t ~

grep --invert-match "#.*" pacman.lst | grep  . | xargs paru -S --needed --noconfirm

mkdir -p ~/tools
mkdir -p ~/github.com
mkdir -p ~/gitlab.com

# Install gcloud
if [ ! -d ~/tools/google-cloud-sdk ] 
then
  pusd ~/tools
  curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-426.0.0-linux-x86_64.tar.gz
  tar -xf google-cloud-cli-426.0.0-linux-x86_64.tar.gz
  rm google-cloud-cli-426.0.0-linux-x86_64.tar.gz
  ./google-cloud-sdk/install.sh
  ./google-cloud-sdk/bin/gcloud init
  popd
fi

