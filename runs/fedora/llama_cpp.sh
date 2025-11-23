#!/usr/bin/env bash

sudo dnf install -y git cmake make gcc-c++ mesa-vulkan-drivers vulkan-loader vulkan-headers glslang-tools spirv-tools libcurl-devel ccache
mkdir -p $HOME/personal/github/llama.cpp

git clone https://github.com/ggerganov/llama.cpp.git $HOME/personal/github/llama.cpp

pushd $HOME/personal/github/llama.cpp
mkdir build
cd build
cmake .. -DGGML_VULKAN=ON -DGGML_CCACHE=ON # -DGGML_CCACHE=ON is optional
cmake --build . --config Release -j$(nproc)
popd
