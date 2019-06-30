#!/usr/bin/env bash

set -xeu

BUILD_NO=${1:-default}

if [[ ${BUILD_NO} == "default" ]]; then
	echo "missing build number"
	exit 1
fi

cp /src/Python-3.6.8.tgz /

tar -zxvf Python-3.6.8.tgz

cd Python-3.6.8

./configure --prefix /opt/python/3.6.8 --enable-optimizations

make

make install

fpm \
  -s dir \
  -t deb \
  -v ${BUILD_NO} \
  -n python3.6.8 \
  -p /opt/python/ \
  /opt/python/3.6.8
