#!/usr/bin/env bash

sudo apt install curl zsh rofi tmux fzf -y
sudo apt install -y vim luarocks xclip
hash -r
sudo chsh -s $(which zsh)
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

mkdir -p ~/.config

cp -r ~/trench/dotfiles/bin $HOME/bin
rm ~/.zshrc
rm ~/.zsh_profile
ln -s ~/trench/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/trench/dotfiles/zsh/.zsh_profile ~/.zsh_profile
cp -r ~/trench/dotfiles/config/nvim ~/.config/nvim
cp -r ~/trench/dotfiles/config/tmux ~/.config/tmux
. ~/.zshrc

sudo apt-get install -y locales
sudo locale-gen en_US.UTF-8
LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"
