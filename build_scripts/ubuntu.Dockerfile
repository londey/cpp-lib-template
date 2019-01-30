
FROM ubuntu:18.04

RUN apt update && apt upgrade -y \
  && apt install -y \
    build-essential \
    clang \
    curl \
    git \
    lcov \
    ninja-build \
    tar \
    unzip \
    wget

RUN curl -L https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2-Linux-x86_64.sh -o cmake.sh \
  && sh cmake.sh --prefix=/usr/local/ --exclude-subdir

WORKDIR /vcpkg

COPY setup-vcpkg.sh .
RUN ./setup-vcpkg.sh

COPY internal_build.sh /

WORKDIR /working/build
