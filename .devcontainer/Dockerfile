FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-24.04

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends\
    catch2\
    libegl1-mesa-dev \
    libeigen3-dev\
    libepoxy-dev\
    libgl-dev\
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libxcursor-dev\
    libxi-dev \
    libxrandr-dev \
    python3-dev\
    x11-apps

# COPY ./3rdparty /tmp/
# WORKDIR /tmp/3rdparty/Pangolin/build/
# RUN cmake .. -DCMAKE_BUILD_TYPE=Release && cmake --build . && cmake --install .
