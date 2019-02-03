cmake_minimum_required(VERSION 3.10)
project (CPP_LIB_TEMPLATE)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "-g -O0 -Wall -Werror -fprofile-arcs -ftest-coverage")
# set(CMAKE_CXX_OUTPUT_EXTENSION_REPLACE ON)

add_subdirectory(src)

enable_testing()

add_subdirectory(test)
