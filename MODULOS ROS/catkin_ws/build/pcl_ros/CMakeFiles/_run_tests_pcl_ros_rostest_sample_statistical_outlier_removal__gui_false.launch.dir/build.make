# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/robotica/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/robotica/catkin_ws/build

# Utility rule file for _run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch.

# Include the progress variables for this target.
include pcl_ros/CMakeFiles/_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch.dir/progress.make

pcl_ros/CMakeFiles/_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch:
	cd /home/robotica/catkin_ws/build/pcl_ros && ../catkin_generated/env_cached.sh /usr/bin/python /opt/ros/kinetic/share/catkin/cmake/test/run_tests.py /home/robotica/catkin_ws/build/test_results/pcl_ros/rostest-sample_statistical_outlier_removal__gui_false.xml "/opt/ros/kinetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/robotica/catkin_ws/src/pcl_ros --package=pcl_ros --results-filename sample_statistical_outlier_removal__gui_false.xml --results-base-dir \"/home/robotica/catkin_ws/build/test_results\" /home/robotica/catkin_ws/src/pcl_ros/samples/pcl_ros/filters/sample_statistical_outlier_removal.launch gui:=false"

_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch: pcl_ros/CMakeFiles/_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch
_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch: pcl_ros/CMakeFiles/_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch.dir/build.make

.PHONY : _run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch

# Rule to build all files generated by this target.
pcl_ros/CMakeFiles/_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch.dir/build: _run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch

.PHONY : pcl_ros/CMakeFiles/_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch.dir/build

pcl_ros/CMakeFiles/_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch.dir/clean:
	cd /home/robotica/catkin_ws/build/pcl_ros && $(CMAKE_COMMAND) -P CMakeFiles/_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch.dir/cmake_clean.cmake
.PHONY : pcl_ros/CMakeFiles/_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch.dir/clean

pcl_ros/CMakeFiles/_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch.dir/depend:
	cd /home/robotica/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/robotica/catkin_ws/src /home/robotica/catkin_ws/src/pcl_ros /home/robotica/catkin_ws/build /home/robotica/catkin_ws/build/pcl_ros /home/robotica/catkin_ws/build/pcl_ros/CMakeFiles/_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pcl_ros/CMakeFiles/_run_tests_pcl_ros_rostest_sample_statistical_outlier_removal__gui_false.launch.dir/depend

