#!/usr/bin/env bash

if [[ ! -h "$HOME/bin" ]]; then
    ln -s ~/trench/dotfiles/bin ~/bin
    exit 0
fi

# sym link zsh config
rm ~/.zshrc
rm ~/.zsh_profile
ln -s ~/trench/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/trench/dotfiles/zsh/.zsh_profile ~/.zsh_profile
