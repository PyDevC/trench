#!/usr/bin/env bash

suto apt update -y
sudo apt install -y ninja-build cmake make meson ccache build-essential
sudo apt install -y gcc clang lua5.1 luajit
