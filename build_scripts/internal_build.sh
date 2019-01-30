#!/bin/bash

set -xe
cmake \
    -G Ninja \
    -Werror=dev \
    -Werror=deprecated \
    -DCMAKE_TOOLCHAIN_FILE=/vcpkg/vcpkg/scripts/buildsystems/vcpkg.cmake ..
ninja all
ctest -VV ..
gcov src/CMakeFiles/some-lib.dir/*.gcno
lcov --capture --directory src/CMakeFiles/some-lib.dir --output-file test_coverage.info
genhtml test_coverage.info --output-directory out
