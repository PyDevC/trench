#!/usr/bin/env bash

sudo dnf install -y cmake make ninja-build lld clang ccache llvm git
repoloc="$HOME/personal/github/llvm-project"

if [[ ! -d $repoloc ]];then
    mkdir $repoloc
    git clone https://github.com/llvm/llvm-project.git $repoloc
fi

pushd $repoloc
cmake -S llvm -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
                                -DLLVM_ENABLE_PROJECTS="clang;lld;mlir;" \
                                -DLLVM_USE_LINKER=lld \
                                -DLLVM_PARALLEL_LINK_JOBS=3 \
                                -DLLVM_PARALLEL_TABLEGEN_JOBS=5

sudo ninja -C build install
popd
