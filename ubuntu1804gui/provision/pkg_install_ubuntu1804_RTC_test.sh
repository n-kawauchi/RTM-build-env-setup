#!/bin/sh
#
# @file pkg_install_ubuntu1804_RTC_test.sh
# @brief OpenRTM-aist sample RTC dependency package 
#        install script for Ubuntu 18.04.
#

# Python Tkinter
apt-get -y install python-tk tix-dev

# OpenCV
apt-get -y install libopencv-dev

# openrtp depends on java8
add-apt-repository ppa:openjdk-r/ppa -y
apt-get update
apt-get -y install openjdk-8-jdk
JAVA8=`update-alternatives --list java | grep java-8`
update-alternatives --set java ${JAVA8}

# rtctree
cd $HOME
wget https://github.com/gbiggs/rtctree/archive/v4.2.0.tar.gz
tar xvzf v4.2.0.tar.gz
cd rtctree-4.2.0
python setup.py build
sudo python setup.py install