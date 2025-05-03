FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-24.04
SHELL [ "/bin/bash", "-c" ]

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install\
    libeigen3-dev \
    libopencv*-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    x11-apps

# Add path to installed libraries
RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/usr_local.conf && ldconfig

# Copy all 3rd party packages to be built
COPY ./3rdparty /tmp/3rdparty

# Build Pangolin
WORKDIR /tmp/3rdparty/Pangolin/build/
RUN sed -i 's/--no-install-suggests//g' ../scripts/install_prerequisites.sh
RUN sed -i 's/--no-install-recommends//g' ../scripts/install_prerequisites.sh
RUN apt-get update && apt-get install -y python3-dev python3-setuptools python3-pip python3-wheel libeigen3-dev
RUN yes | ../scripts/install_prerequisites.sh -u all && cmake .. -DCMAKE_BUILD_TYPE=Release && cmake --build . && cmake --install .

# Build ceres-solver
WORKDIR /tmp/3rdparty/ceres-solver/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release && cmake --build . && cmake --install .

# Build DBoW3
WORKDIR /tmp/3rdparty/DBoW3/build
RUN for f in ../src/*.cpp; do sed -i '1i#include <cstdint>' "${f/%.cpp/.h}"; done
RUN for f in ../src/*.cpp; do sed -i '1i#include <fstream>' "${f/%.cpp/.h}"; done
RUN cmake .. -DCMAKE_BUILD_TYPE=Release && cmake --build . && cmake --install .

# Build g2o
WORKDIR /tmp/3rdparty/g2o/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release && cmake --build . && cmake --install .

# Build googletest
WORKDIR /tmp/3rdparty/googletest/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release && cmake --build . && cmake --install .

# Build Sophus
WORKDIR /tmp/3rdparty/Sophus/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release && cmake --build . && cmake --install .

RUN ldconfig