#!/usr/bin/env bash

printf "Types of container installs:\npytorch\ndevenv\ngeneral\nllvm\nremoteuser\n"
read -p "Enter one of the container type: " conttype
echo $conttype

if [[ $conttype == "devenv" ]]; then
    read -p "Enter Container os name[ubuntu/fedora]: " os
    ./run $os build neovim rocm setup core llama vulkan
    ./runs/$os/python_env.sh ml pandas scikit-learn numpy matplotlib
elif [[ $conttype == "pytorch" ]]; then
    ./run ubuntu setup pytorch rocm neovim buildsystem
elif [[ $conttype == "general" ]]; then
    ./run fedora firefox gimp setup
elif [[ $conttype == "remoteuser" ]]; then
    ./run fedora setup
elif [[ $conttype == "llvm" ]]; then
    ./run ubuntu llvm setup buildsystem neovim
fi
