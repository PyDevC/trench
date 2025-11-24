#!/usr/bin/env bash

read -p "Enter Container os name[ubuntu/fedora]: " os
run $os build neovim rocm setup core llama vulkan
runs/$os/python_env.sh ml pandas scikit-learn numpy matplotlib
