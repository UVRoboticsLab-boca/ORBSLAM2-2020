# Install script for directory: /home/robotica/catkin_ws/src/naoqi_bridge/naoqi_sensors_py

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/robotica/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  include("/home/robotica/catkin_ws/build/naoqi_bridge/naoqi_sensors_py/catkin_generated/safe_execute_install.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/naoqi_sensors_py" TYPE FILE FILES "/home/robotica/catkin_ws/devel/include/naoqi_sensors_py/NaoqiCameraConfig.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/naoqi_sensors_py" TYPE FILE FILES "/home/robotica/catkin_ws/devel/include/naoqi_sensors_py/NaoqiMicrophoneConfig.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/naoqi_sensors_py" TYPE FILE FILES "/home/robotica/catkin_ws/devel/lib/python2.7/dist-packages/naoqi_sensors_py/__init__.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/robotica/catkin_ws/devel/lib/python2.7/dist-packages/naoqi_sensors_py/cfg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/naoqi_sensors_py" TYPE DIRECTORY FILES "/home/robotica/catkin_ws/devel/lib/python2.7/dist-packages/naoqi_sensors_py/cfg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/robotica/catkin_ws/build/naoqi_bridge/naoqi_sensors_py/catkin_generated/installspace/naoqi_sensors_py.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/naoqi_sensors_py/cmake" TYPE FILE FILES
    "/home/robotica/catkin_ws/build/naoqi_bridge/naoqi_sensors_py/catkin_generated/installspace/naoqi_sensors_pyConfig.cmake"
    "/home/robotica/catkin_ws/build/naoqi_bridge/naoqi_sensors_py/catkin_generated/installspace/naoqi_sensors_pyConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/naoqi_sensors_py" TYPE FILE FILES "/home/robotica/catkin_ws/src/naoqi_bridge/naoqi_sensors_py/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/naoqi_sensors_py" TYPE PROGRAM FILES "/home/robotica/catkin_ws/build/naoqi_bridge/naoqi_sensors_py/catkin_generated/installspace/camera.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/naoqi_sensors_py" TYPE PROGRAM FILES "/home/robotica/catkin_ws/build/naoqi_bridge/naoqi_sensors_py/catkin_generated/installspace/microphone.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/naoqi_sensors_py" TYPE PROGRAM FILES "/home/robotica/catkin_ws/build/naoqi_bridge/naoqi_sensors_py/catkin_generated/installspace/octomap.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/naoqi_sensors_py" TYPE PROGRAM FILES "/home/robotica/catkin_ws/build/naoqi_bridge/naoqi_sensors_py/catkin_generated/installspace/sonar.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/naoqi_sensors_py/launch" TYPE FILE FILES
    "/home/robotica/catkin_ws/src/naoqi_bridge/naoqi_sensors_py/launch/camera.launch"
    "/home/robotica/catkin_ws/src/naoqi_bridge/naoqi_sensors_py/launch/microphone.launch"
    "/home/robotica/catkin_ws/src/naoqi_bridge/naoqi_sensors_py/launch/octomap.launch"
    "/home/robotica/catkin_ws/src/naoqi_bridge/naoqi_sensors_py/launch/sonar.launch"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/naoqi_sensors_py" TYPE DIRECTORY FILES "/home/robotica/catkin_ws/src/naoqi_bridge/naoqi_sensors_py/share")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/robotica/catkin_ws/build/naoqi_bridge/naoqi_sensors_py/src/cmake_install.cmake")

endif()

