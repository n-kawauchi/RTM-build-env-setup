#!/bin/bash

USER_ID=vagrant

VERSION=2.0.0
JAVA_SHORT_VER=`echo $VERSION | cut -b 1-3`
CURRENT_DIR=`pwd`

if test -d work; then
	rm -rf work
fi
mkdir work

export JAVA_HOME=/usr/
sh buildRTC.sh
sh buildPackage.sh

cp jp.go.aist.rtm.RTC/jar/source/OpenRTM*jar.zip work/
cd work
unzip OpenRTM-aist-Java-${VERSION}-jar.zip
cd OpenRTM-aist/${JAVA_SHORT_VER}
cp -r ${CURRENT_DIR}/packages .

cd packages/deb
sh dpkg_build.sh

mkdir -p /home/${USER_ID}/java-deb-pkgs
cp ../openrtm2* /home/${USER_ID}/java-deb-pkgs
