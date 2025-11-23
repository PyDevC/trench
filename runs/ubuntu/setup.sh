#!/usr/bin/env bash

sudo apt install rofi tmux fzf -y
bash ~/trench/install/clipboard.sh
bash ~/trench/install/zsh.sh
bash ~/trench/install/vim.sh

mkdir .config

cp ~/trench/dotfiles/bin $HOME
rm ~/.zshrc
rm ~/.zsh_profile
ln -s ~/trench/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/trench/dotfiles/zsh/.zsh_profile ~/.zsh_profile
. ~/.zshrc
cp ~/trench/dotfiles/config/nvim ~/.config/nvim
cp ~/trench/dotfiles/config/tmux ~/.config/tmux
