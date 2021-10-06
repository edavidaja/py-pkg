#!/usr/bin/env bash

set -xeu
echo "Build script starting..."

cp /src/Python-${VERSION}.tgz /

tar -zxvf Python-${VERSION}.tgz

cd Python-${VERSION}

./configure \
  --enable-ipv6 \
  --enable-optimizations \
  --enable-shared \
  --prefix /opt/python/${VERSION} 

if [ ! -d /output/${OS_IDENTIFIER} ]; then
  mkdir /output/${OS_IDENTIFIER}
fi

make

make install

fpm \
  -s dir \
  -t deb \
  -v ${BUILD_NUMBER} \
  -n python${VERSION} \
  -p /output/${OS_IDENTIFIER}/ \
  /opt/python/${VERSION}

