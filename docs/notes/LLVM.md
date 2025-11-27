# LLVM 

LLVM is an umbrella project which provides tools and modules to make reusable compilers.
LLVM has something called LLVM IR which allows any frontend to be connect to anyother backend, also LLVM supports a lots of tooling for code generation for wide variety of CPU archs.

In container we will be building LLVM project for getting some tools such as clang, lldb (llvm debugger), libc++, libc, compiler-rt, mlir, OpenMP, polly, libclc, klee, lld, bolt, etc.

## Explain script
we first install dependencies -> cmake, make, ninja-build, llvm, lld, clang, ccache, build-essential
then we clone llvm-project repository into the desired location.
right after that we start to make build script, which uses cmake for selecting the buildsystem, applying options to check what projects to build, and limit thread utilization.
then we start installing llvm.

## LLVM build options

### -DCMAKE_BUILD_TYPE=Release
This option tells cmake to build llvm for Release, other values for this option are Debug

### -DLLVM_ENABLE_PROJECTS=""
This option tells cmake what sub projects to build from llvm-project repo.

### -DLLVM_USE_LINKER=lld 
This option tells which linker to use

All other options are descriptive on their own.
