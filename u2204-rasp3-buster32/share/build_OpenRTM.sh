#!/bin/bash

USER_ID=pi
if test -d build; then
        rm -rf build
fi
mkdir build
cd build

cmake\
 -DSSL_ENABLE=ON  \
 -DOBSERVER_ENABLE=ON \
 -DDOCUMENTS_ENABLE=ON \
 -DBUILD_RTM_LINUX_PKGS=ON \
 -DCMAKE_BUILD_TYPE=Release \
 -DCMAKE_INSTALL_PREFIX=/home/${USER_ID}/rtm/install ..
cmake --build . --target install/strip -- -j$(nproc)

mkdir -p /home/${USER_ID}/cxx-deb-pkgs
cp rules ../packages/deb/debian
cp control ../packages/deb/debian
cd ../packages/deb
sh dpkg_build.sh
cp ../openrtm2* /home/${USER_ID}/cxx-deb-pkgs

