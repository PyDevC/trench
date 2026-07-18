#!/usr/bin/env bash

suto apt update -y
sudo apt install cmake make ninja-build llvm lld clang ccache build-essential git -y
repoloc="$HOME/personal/github/llvm-project"

if [[ ! -d $repoloc ]];then
    mkdir -p $repoloc
    git clone https://github.com/llvm/llvm-project.git $repoloc
fi

mkdir -p $repoloc/build
pushd $repoloc

cmake -G Ninja -Bbuild llvm \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_C_COMPILER=clang \
    -DLLVM_BUILD_EXAMPLES=ON \
    -DLLVM_CCACHE_BUILD=ON \
    -DLLVM_CCACHE_BUILD=ON \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DLLVM_ENABLE_PROJECTS=mlir \
    -DLLVM_PARALLEL_LINK_JOBS=3 \
    -DLLVM_PARALLEL_TABLEGEN_JOBS=5 \
    -DLLVM_TARGETS_TO_BUILD="Native;AMDGPU" \
    -DLLVM_USE_LINKER=lld \
    -DMLIR_AMDGPU_TARGET_CHIP=gfx1101 \
    -DMLIR_ENABLE_BINDINGS_PYTHON=ON \
    -DMLIR_ENABLE_ROCM_CONVERSIONS=ON \
    -DMLIR_ENABLE_ROCM_RUNNER=ON \
    -DPython3_FIND_VIRTUALENV=ONLY \
    -DPython_FIND_VIRTUALENV=ONLY \
    -DROCM_PATH=/opt/rocm

sudo cmake --build build
popd
