cmake_minimum_required(VERSION 3.22)
project(chapter3)

set(CMAKE_CXX_STANDARD 23)

find_package(Eigen3 REQUIRED)
find_package(Pangolin REQUIRED)
include_directories(${Pangolin_INCLUDE_DIRS})

# 加入各子工程
add_subdirectory(useEigen)
add_subdirectory(useGeometry)
add_subdirectory(usePangolin)
add_subdirectory(visualizeGeometry)
add_subdirectory(examples)
