#!/usr/bin/env bash

sudo dnf update -y
sudo dnf install -y vulkan-tools vulkan-loader-devel vulkan-validation-layers-devel
vulkaninfo
