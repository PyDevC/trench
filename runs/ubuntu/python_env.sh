#!/usr/bin/env bash

envloc="$HOME/personal/env/python"
sudo apt install python3-venv
mkdir -p $envloc

pushd $envloc
python3 -m venv $1
source $envloc/$1/bin/activate
pip install --upgrade pip
pip install "${@:2}"
popd
