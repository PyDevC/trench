#!/usr/bin/env bash

# General Installation Script: Installs Software Not Required by Other Containers
# One Time Running This script

if [[ -z "$(ls ~/.ssh)" ]]; then
    echo "Get Ready with SSH first"
    exit 0
fi

chmod +x ./install/*

for scr in $(ls ./install); do
    echo "Running ./install/$scr"
    ./install/$scr
done

# Setup Dotfiles
git clone git@github.com:PyDevC/.dot.git $HOME/.dot
ln -s ~/.dot/bin ~/bin
rm ~/.zshrc
rm ~/.zsh_profile
ln -s ~/.dot/zsh/.zshrc ~/.zshrc
ln -s ~/.dot/zsh/.zsh_profile ~/.zsh_profile
. ~/.zshrc
syncf
exit 0
