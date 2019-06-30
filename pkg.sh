#!/usr/bin/env bash

fpm \
  -s dir \
  -t deb \
  -v 1234 \
  -n python3.6.8 \
  -p ./ \
  /opt/python/3.6.8
