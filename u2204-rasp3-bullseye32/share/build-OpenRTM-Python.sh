#!/bin/bash

USER_ID=vagrant

sudo apt install -y python3-all-dev

if test -d build; then
	rm -rf build
fi
if test -d dist; then
	rm -rf dist
fi

python3 setup.py build
python3 setup.py sdist

VERSION=`python3 setup.py --version`

cd dist/
tar xf OpenRTM-aist-Python-${VERSION}.tar.gz
cd OpenRTM-aist-Python-${VERSION}/packages
make

mkdir -p /home/${USER_ID}/python-deb-pkgs
cp openrtm2* /home/${USER_ID}/python-deb-pkgs
