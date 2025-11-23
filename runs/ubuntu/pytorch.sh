#!/usr/bin/env bash

sudo apt install wget git gcc clang cmake meson ninja-build python3-venv

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

source ~/miniconda3/bin/activate
conda tos accept
conda init
conda create -y -n torchdev
conda activate torchdev

mkdir -p $HOME/personal/env/python
pushd $HOME/personal/env/python
python3 -m venv torch
source torch/bin/activate
popd 

repoloc="$HOME/personal/contrib/tdk/pytorch"

if [[ ! -d $repoloc ]];then
    mkdir -p $repoloc
    git clone git@github.com:PyDevC/pytorch.git $repoloc
fi

pushd $repoloc
git submodule sync
git submodule update --init --recursive
pip install --group dev
pip install mkl-static mkl-include
make triton
popd
