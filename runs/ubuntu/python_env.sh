#!/usr/bin/env bash

sudo apt install python3-venv
mkdir -p $HOME/personal/env/python

pushd $HOME/personal/env/python
python3 -m venv $1
source $HOME/personal/env/python/$1/bin/activate
pip install --upgrade pip
popd
