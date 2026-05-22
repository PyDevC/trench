#!/usr/bin/env bash

sudo dnf install -y cmake make ninja-build lld clang ccache llvm git
repoloc="$HOME/personal/github/llvm-project"

if [[ ! -d $repoloc ]];then
    mkdir -p "$HOME/personal/github"
    git clone https://github.com/llvm/llvm-project.git $repoloc
fi

pushd $repoloc
cmake -GNinja -Bbuild llvm \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DLLVM_ENABLE_PROJECTS="clang;lld;mlir;clang-tools-extra;compiler-rt;llvm;lldb;" \
    -DPython3_FIND_VIRTUALENV=ONLY \
    -DPython_FIND_VIRTUALENV=ONLY \
    -DMLIR_ENABLE_BINDINGS_PYTHON=ON \
    -DLLVM_TARGETS_TO_BUILD=host \
    -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
    -DLLVM_USE_LINKER=lld \
    -DLLVM_PARALLEL_LINK_JOBS=3 \
    -DLLVM_CCACHE_BUILD=ON \
    -DLLVM_PARALLEL_TABLEGEN_JOBS=5 \

sudo cmake --build build
popd
