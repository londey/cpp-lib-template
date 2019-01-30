


add_library(some-lib
    include/PublicClass.hpp
    InternalClass.cpp
    InternalClass.hpp
    PublicClass.cpp
)

target_compile_features(some-lib PUBLIC cxx_std_17)
target_include_directories(some-lib PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)

