#!/usr/bin/env bash

printf "Types of container installs:\npytorch\ndevenv\ngeneral\nllvm\nremoteuser\n"
read -p "Enter one of the container type: " conttype
echo $conttype

if [[ $conttype == "devenv" ]]; then
    read -p "Enter Container os name[ubuntu/fedora]: " os
    if [[ $os == "ubuntu" ]]; then
        sudo apt update -y
    elif [[ $os == "fedora" ]]; then
        sudo dnf update -y
    fi
    ./run $os build neovim rocm setup core llama vulkan
    ./runs/$os/python_env.sh ml pandas scikit-learn numpy matplotlib
elif [[ $conttype == "pytorch" ]]; then
    sudo apt update -y
    ./run ubuntu setup pytorch rocm neovim buildsystem
elif [[ $conttype == "general" ]]; then
    sudo dnf update -y
    ./run fedora firefox gimp setup
elif [[ $conttype == "remoteuser" ]]; then
    sudo dnf update -y
    ./run fedora setup
elif [[ $conttype == "llvm" ]]; then
    sudo apt update -y
    ./run ubuntu llvm setup buildsystem neovim
fi
