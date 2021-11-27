#!/bin/bash
symlink_config()
{
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
  FILE=$1
  echo "removing $FILE and symlinking from $DIR"
  rm ~/$FILE
  ln -s $DIR/$FILE ~/$FILE
}

symlink_config .xinitrc
symlink_config .Xresources
symlink_config .Xmodmap
symlink_config .config/compton.conf
symlink_config .i3/config
symlink_config .vim/vimrc
symlink_config .vim/plugins.vim
symlink_config .vim/set.vim
symlink_config .vim/mappings.vim
symlink_config .vim/run.vim
symlink_config .vim/after
symlink_config .vim/autogroups.vim
symlink_config .profile
symlink_config .bash_profile
symlink_config .bashrc
symlink_config .zshrc
symlink_config .config/fish/config.fish
symlink_config .config/fish/functions
symlink_config .gitconfig
symlink_config .ssh/config
symlink_config .config/Code/User/settings.json
symlink_config .config/alacritty/alacritty.yml
symlink_config .config/starship.toml
symlink_config .config/amfora/config.toml
symlink_config .tmux.conf
symlink_config .taskrc
