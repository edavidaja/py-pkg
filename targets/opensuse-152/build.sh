#!/usr/bin/env bash

set -xeu
echo "Build script starting..."

cp /src/Python-${VERSION}.tgz /

tar -zxvf Python-${VERSION}.tgz

cd Python-${VERSION}

./configure \
    --prefix=/opt/python/${VERSION} \
    --enable-shared \
    --enable-ipv6 \
    LDFLAGS=-Wl,-rpath=/opt/python/${VERSION}/lib,--disable-new-dtags

make
make install

fpm \
  -s dir \
  -t rpm \
  -v ${BUILD_NUMBER} \
  -n python${VERSION} \
  -p /output/${OS_IDENTIFIER}/ \
  /opt/python/${VERSION}
