add_executable(coordinateTransform coordinateTransform.cpp)
target_link_libraries(coordinateTransform Eigen3::Eigen)

add_executable(plotTrajectory plotTrajectory.cpp)
target_link_libraries(plotTrajectory ${Pangolin_LIBRARIES} Eigen3::Eigen)
