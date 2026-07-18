#!/usr/bin/env bash

sudo dnf update -y
sudo dnf install -y ninja-build cmake make meson ccache
sudo dnf install -y gcc clang lua luajit
