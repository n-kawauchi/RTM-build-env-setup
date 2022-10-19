#!/bin/bash

sudo apt install -y flex bison
wget https://github.com/fluent/fluent-bit/archive/v1.8.9.tar.gz
tar xvzf v1.8.9.tar.gz
cd fluent-bit-1.8.9
sed  -i -e 's/jemalloc-5.2.1\/configure/jemalloc-5.2.1\/configure --disable-initial-exec-tls/g' CMakeLists.txt
mkdir build
cd build/
cmake -DFLB_RELEASE=On\
 -DFLB_TRACE=Off\
 -DFLB_JEMALLOC=On\
 -DFLB_TLS=On\
 -DFLB_SHARED_LIB=On\
 -DFLB_EXAMPLES=Off\
 -DFLB_HTTP_SERVER=On\
 -DFLB_IN_SYSTEMD=On\
 -DFLB_OUT_KAFKA=On\
 -DCMAKE_BUILD_TYPE=Release\
 -DCMAKE_INSTALL_PREFIX=/home/vagrant/flb/install ..

cmake --build . -- -j$(nproc)
cmake --build . --target install
cp -r include/jemalloc\
 ../lib/msgpack-*/include/msgpack.h\
 ../lib/msgpack-*/include/msgpack\
 ../lib/mbedtls-*/include/mbedtls\
 ../lib/c-ares-*/include/*.h\
 lib/c-ares-*/ares_build.h\
 lib/c-ares-*/ares_config.h\
 ../lib/cmetrics/include/cmetrics\
 ../lib/cmetrics/include/prometheus_remote_write\
 /home/vagrant/flb/install/include/
