#!/usr/bin/env bash

sudo dnf install rofi-wayland tmux fzf -y
bash ~/trench/install/clipboard.sh
bash ~/trench/install/zsh.sh
bash ~/trench/install/vim.sh

mkdir -p ~/.config

cp -r ~/trench/dotfiles/bin $HOME/bin
rm ~/.zshrc
rm ~/.zsh_profile
ln -s ~/trench/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/trench/dotfiles/zsh/.zsh_profile ~/.zsh_profile
. ~/.zshrc
cp -r ~/trench/dotfiles/config/nvim ~/.config/nvim
cp -r ~/trench/dotfiles/config/tmux ~/.config/nvim
