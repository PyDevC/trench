#!/usr/bin/env bash

git clone https://github.com/PyDevC/pytorch_dev_env_setup
echo "Manually run this script as it might be dangerous if ran automatically"

# sudo apt-get update 
# sudo apt-get install -y \
#         wget \
#         build-essential \
#         ca-certificates \
#         clang \
#         python3-venv \
#         ccache \
#         cmake \
#         curl \
#         git \
#         meson \
#         ninja-build \
#         libjpeg-dev \
#         libpng-dev && \
# 
# mkdir -p ~/miniconda3
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
# bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
# rm ~/miniconda3/miniconda.sh
# 
# source ~/miniconda3/bin/activate
# conda tos accept
# conda init
# conda create -y -n torchdev
# conda activate torchdev
# 
# mkdir -p $HOME/personal/env/python
# pushd $HOME/personal/env/python
# python3 -m venv torchsetup
# source torch/bin/activate
# popd 
# 
# repoloc="$HOME/personal/contrib/tdk/pytorch"
# 
# if [[ ! -d $repoloc ]];then
#     mkdir -p "$HOME/personal/contrib/tdk"
#     git clone git@github.com:PyDevC/pytorch.git $repoloc
# fi
# 
# pushd $repoloc
# source ~/personal/env/python/torch/bin/activate
# git submodule sync
# git submodule update --init --recursive
# pip install --group dev
# pip install mkl-static mkl-include
# make triton
# popd
