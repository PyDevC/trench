#!/usr/bin/env bash

read -p "Only continue if you have names of your containers how the owner of this repository decided: [y/N] " action
if [[ "$action" != "Y" && "$action" != "y" ]]; then
    exit 1;
fi

dev shell devenv
cd trench
./run fedora buildsystem neovim rocm vulkan core llama;
exit

dev shell pytorch
cd trench
./run ubuntu buildsystem neovim rocm
exit

dev shell llvm
./run ubuntu buildsystem neovim llvm
exit
