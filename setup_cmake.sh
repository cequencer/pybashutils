#!/bin/bash
# 
# Does NOT use sudo
#
# Compiles and installs CMake on Linux (CentOS, Debian, Ubuntu)
#
# Alternatives: linuxbrew (Linux), Homebrew (Mac), Scoop (Windows)
#
# prereqs
# CentOS:  yum install gcc-c++ make ncurses-devel
# Debian/Ubuntu: apt install g++ make libncurses-dev

cver=3.11.2
PREF=$HOME/.local/cmake

set -e # after prereqs

# 1. download
WD=/tmp
wget -nc -P $WD https://cmake.org/files/v${cver:0:4}/cmake-$cver.tar.gz

# 2. build
(
cd $WD

tar -xf cmake-$cver.tar.gz

echo "installing cmake to $PREF"
./cmake-$cver/bootstrap --prefix=$PREF

make -j2
make install
)

echo "----------------------------------------------------"
echo "please add $PREF/bin to your PATH (in ~/.bashrc)"
echo "then reopen a new terminal to use CMake $cver"


