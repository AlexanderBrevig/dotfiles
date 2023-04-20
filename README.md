# dotfiles

Nothing to see here. My personal dotfiles.
Rewritten to use GNU Stow.

## Setup

First, we need some tools

```sh
sudo pacman -S --needed base-devel openssh git stow gnupg
```

```sh
mkdir -p tools && cd tools
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

```sh
mkdir -p github.com && cd github.com
git clone git@github.com:AlexanderBrevig/dotfiles
cd dotfiles
./arch.sh
./git.sh
```
