#!/bin/ksh

ulimit -d 2049*1024 # increase data limit size so the LLVM compiler doesn't fail with Out of memory error

git clone --depth 1 --branch release/16.x https://github.com/llvm/llvm-project llvm-project-16

cd llvm-project-16

mkdir build-release
cd build-release

cmake ../llvm \
  -DCMAKE_INSTALL_PREFIX=$HOME/.local/llvm16 \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_ENABLE_PROJECTS="lld;clang" \
  -DLLVM_ENABLE_LIBXML2=OFF \
  -DLLVM_ENABLE_TERMINFO=OFF \
  -DLLVM_ENABLE_LIBEDIT=OFF \
  -DLLVM_ENABLE_ASSERTIONS=ON \
  -DLLVM_PARALLEL_LINK_JOBS=1 \
  -G Ninja

ninja install
