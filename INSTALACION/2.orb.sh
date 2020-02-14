#!/bin/bash 
# OpenCV >= 2.4.6
mkdir src
cd ~/src/
mkdir orbslam2
# Boost
sudo apt-get install libboost-dev -y

# OpenGL
sudo apt-get install -y mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev libglew-dev
sudo apt-get install -y freeglut3-dev freeglut3
sudo apt-get install -y build-essential gdb subversion
sudo apt-get install -y automake autoconf libtool
sudo apt-get install -y libgtk2.0-dev libxmu-dev libxxf86vm-dev
sudo apt-get install -y binutils-gold
sudo apt-get install -y build-essential

# Pangolin
cd ~/src/orbslam2
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir build
cd build
cmake ..
cmake --build .



cd ~/src/orbslam2

# Build tools:
sudo apt-get install -y build-essential cmake

# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
sudo apt-get install -y libgtkglext1-dev libvtk6-dev

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# BLAS and LAPACK
sudo apt-get install -y libblas-dev
sudo apt-get install -y liblapack-dev

# INSTALL THE LIBRARY (YOU CAN CHANGE '3.0.0' FOR THE LAST STABLE VERSION)

sudo apt-get install -y unzip wget
cd ~
wget https://github.com/Itseez/opencv/archive/3.0.0.zip
unzip 3.0.0.zip
rm 3.0.0.zip
cd opencv-3.0.0
mkdir build
cd build
cmake -DWITH_TBB=ON -DWITH_XINE=ON -DWITH_IPP=ON ..
make -j4
sudo make install
# Fix -lippicv linking error
sudo cp ~/opencv-3.0.0/3rdparty/ippicv/unpack/ippicv_lnx/lib/intel64/libippicv.a /usr/local/lib
sudo ldconfig
cd ~


sudo apt-get install ros-kinetic-rtabmap-ros

