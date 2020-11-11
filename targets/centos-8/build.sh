#!/usr/bin/env bash

set -xeu
echo "Build script starting..."

cp /src/Python-${VERSION}.tgz /

tar -zxvf Python-${VERSION}.tgz

cd Python-${VERSION}

./configure --prefix /opt/python/${VERSION} --enable-optimizations

if [ ! -d /output/${OS_IDENTIFIER} ]; then
  mkdir /output/${OS_IDENTIFIER}
fi

make

make install

fpm \
  -s dir \
  -t rpm \
  -v ${BUILD_NUMBER} \
  -n python${VERSION} \
  --iteration ${OS_IDENTIFIER} \
  -p /output/${OS_IDENTIFIER}/ \
  /opt/python/${VERSION}

