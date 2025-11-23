#!/usr/bin/env bash

version="master"
if [[ ! -z $1 ]];then
    version=$1
fi

loc=$HOME/personal/github/neovim

sudo apt -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra git lua

if [[ ! -d $loc ]];then
    mkdir $loc
    git clone https://github.com/neovim/neovim.git $loc
else
    git fetch --all
    git pull --all
fi

pushd $loc
git checkout $version

make clean
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make build install
popd
