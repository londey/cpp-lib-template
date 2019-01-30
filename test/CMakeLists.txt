add_executable(some-lib-tests
    InternalClass.test.cpp
    main.cpp
    PublicClass.test.cpp
)
target_compile_features(some-lib-tests PUBLIC cxx_std_17)

find_package(Catch2 CONFIG REQUIRED)
target_link_libraries(some-lib-tests PRIVATE
    some-lib
    Catch2::Catch2
)

add_test(
    NAME some-lib-tests
    COMMAND some-lib-tests -s
)
