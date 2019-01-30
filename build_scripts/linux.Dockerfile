
FROM debian:stretch-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt install -y \
  build-essential \
  clang \
  curl \
  git \
  ninja-build \
  tar \
  wget

RUN curl -L https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2-Linux-x86_64.sh -o cmake.sh \
  && sh cmake.sh --prefix=/usr/local/ --exclude-subdir

WORKDIR /vcpkg

COPY setup-vcpkg.sh .
RUN ./setup-vcpkg.sh



RUN echo \
  "ls -l /working \
  && cmake \
      -G Ninja \
      -Werror=dev \
      -Werror=deprecated \
      -DCMAKE_TOOLCHAIN_FILE=/vcpkg/vcpkg/scripts/buildsystems/vcpkg.cmake /working \
  && ninja all \
  && ctest -VV /working" > /build.sh

WORKDIR /build
