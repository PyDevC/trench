#!/usr/bin/env bash

version="master"
if [[ ! -z $1 ]];then
    version=$1
fi

repoloc=$HOME/neovim

sudo apt -y install ninja-build cmake gcc make gettext curl git lua5.1 npm ripgrep

if [[ ! -d $repoloc ]];then
    mkdir -p $HOME/personal/github
    git clone https://github.com/neovim/neovim.git $repoloc
else
    git fetch --all
    git pull --all
fi

pushd $repoloc
git checkout $version

make clean
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make build install
cp build/bin/nvim ~/bin
popd
