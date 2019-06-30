#!/usr/bin/env bash

set -xeu

echo "Preparing build environment"

if [[ ! -d src ]]; then
  echo "Creating src directory and obtaining source code"
  mkdir src
  wget -q -O ./src/Python-3.6.8.tgz https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz
fi

if [[ ! -d output ]]; then
  echo "Creating output directory"
  mkdir output
fi

