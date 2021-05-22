#!/bin/bash

echo
echo "Issue Build Commands"
echo

mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=~/proton-clang-20210509/bin
export CLANG_BIN_PATH=~/proton-clang-20210509/bin
export MKDTIMG_PATH=~/Kirisakura_TEQUILA_Zenfone_7_Fork
export PATH=${CLANG_PATH}:${MKDTIMG_PATH}:${PATH}
export DTC_EXT=/home/srv/Kirisakura_TEQUILA_Zenfone_7_Fork/dtc-aosp
export CROSS_COMPILE=aarch64-linux-gnu-
export ROSS_COMPILE_ARM32=arm-linux-gnueabi-
# export LD_LIBRARY_PATH=~/Android_Build/Clang_Google/linux-x86/clang-r383902c/lib64:$LD_LIBRARY_PATH

export CLANG_AR=$CLANG_BIN_PATH/llvm-ar
export CLANG_CC=$CLANG_BIN_PATH/clang
export CLANG_LD=$CLANG_BIN_PATH/ld.lld
export CLANG_LDLTO=$CLANG_BIN_PATH/ld.lld
export CLANG_NM=$CLANG_BIN_PATH/llvm-nm

echo
echo "Set DEFCONFIG"
echo
make CC=$CLANG_CC LD=$CLANG_LD LDLTO=$CLANG_LD AR=$CLANG_AR NM=$CLANG_NM OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip O=out kirisakura_defconfig -j$(nproc)

echo
echo "Build The Good Stuff"
echo

make CC=$CLANG_CC LD=$CLANG_LD LDLTO=$CLANG_LD AR=$CLANG_AR NM=$CLANG_NM OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip O=out -j$(nproc)
