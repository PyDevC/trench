#!/usr/bin/env bash

sudo apt install cmake make ninja-build llvm lld clang ccache build-essential git -y
repoloc="$HOME/personal/github/llvm-project"

if [[ ! -d $repoloc ]];then
    mkdir -p $repoloc
    git clone https://github.com/llvm/llvm-project.git $repoloc
fi

pushd $repoloc
cmake -S llvm -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
                                -DLLVM_ENABLE_PROJECTS="clang;lld;mlir;clang-tools-extra;compiler-rt;llvm;lldb;" \
                                -DLLVM_USE_LINKER=lld \
                                -DLLVM_PARALLEL_LINK_JOBS=3 \
                                -DLLVM_PARALLEL_TABLEGEN_JOBS=5

sudo ninja -C build install
popd
