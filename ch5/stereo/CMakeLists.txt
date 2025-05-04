find_package(Pangolin REQUIRED)
find_package(Boost REQUIRED)

add_executable(stereoVision stereoVision.cpp)
target_link_libraries(stereoVision ${OpenCV_LIBS} ${Pangolin_LIBRARIES})

file(COPY "left.png" DESTINATION ".")
file(COPY right.png DESTINATION ".")