#!/bin/sh
set -eux

. ./extra/gitlab/env.sh

export CFLAGS="-I$CACHE_DIR/usr/include -I/usr/share/mingw-w64/include/ "

mkdir build_win
cd build_win
cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/toolchain-win64.cmake -DENABLE_TESTS=OFF
make || make VERBOSE=1
