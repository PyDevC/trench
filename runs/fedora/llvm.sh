#!/usr/bin/env bash

sudo dnf install cmake make ninja-build lld clang ccache
git clone https://github.com/llvm/llvm-project.git $HOME/personal/github/llvm-project

pushd $HOME/personal/github/llvm-project
cmake -S llvm -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
                                -DLLVM_ENABLE_PROJECTS="clang;lld;mlir" \
                                -DLLVM_USE_LINKER=lld \
                                -DLLVM_PARALLEL_LINK_JOBS=1 \
                                -DLLVM_PARALLEL_COMPILE_JOBS=10 \
                                -DLLVM_PARALLEL_TABLEGEN_JOBS=5 \

sudo ninja -C build install
popd
