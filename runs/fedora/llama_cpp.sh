#!/usr/bin/env bash

sudo dnf install -y git cmake make gcc-c++ mesa-vulkan-drivers vulkan-loader vulkan-headers glslang-tools spirv-tools libcurl-devel ccache
repoloc="$HOME/personal/github/llama.cpp"

mkdir -p $repoloc

git clone https://github.com/ggerganov/llama.cpp.git $repoloc

pushd $repoloc
mkdir build
cd build
cmake .. -DGGML_VULKAN=ON -DGGML_CCACHE=ON
cmake --build . --config Release -j$(nproc)
popd
