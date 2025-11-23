#!/usr/bin/env bash

sudo apt install curl zsh rofi tmux fzf -y
sudo apt install -y vim luarocks xclip

mkdir .config

cp ~/trench/dotfiles/bin $HOME
rm ~/.zshrc
rm ~/.zsh_profile
ln -s ~/trench/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/trench/dotfiles/zsh/.zsh_profile ~/.zsh_profile
. ~/.zshrc
cp ~/trench/dotfiles/config/nvim ~/.config/nvim
cp ~/trench/dotfiles/config/tmux ~/.config/tmux
