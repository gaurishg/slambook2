cmake_minimum_required(VERSION 3.22)
project(chapter5)

set(CMAKE_CXX_STANDARD 23)
find_package(Eigen3 REQUIRED)
find_package(OpenCV REQUIRED)
# 添加头文件
include_directories(${OpenCV_INCLUDE_DIRS})

add_subdirectory(imageBasics)
add_subdirectory(stereo)
add_subdirectory(rgbd)
