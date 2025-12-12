#!/usr/bin/env bash

ln -s ~/trench/dotfiles/bin ~/bin
rm ~/.zshrc
rm ~/.zsh_profile
ln -s ~/trench/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/trench/dotfiles/zsh/.zsh_profile ~/.zsh_profile
. ~/.zshrc
cp -r ~/trench/dotfiles/config/nvim ~/.config/
cp -r ~/trench/dotfiles/config/tmux ~/.config/
