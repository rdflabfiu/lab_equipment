cmake_minimum_required(VERSION 3.0.2)

project(kuka_kr10_support)

find_package(catkin REQUIRED)

catkin_package()

if (CATKIN_ENABLE_TESTING)
  find_package(roslaunch REQUIRED)
  roslaunch_add_file_check(test/roslaunch_test_kr10r900_2.xml)
  roslaunch_add_file_check(test/roslaunch_test_kr10r1100sixx.xml)
endif()

install(DIRECTORY config launch meshes urdf
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
