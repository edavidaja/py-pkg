#!/usr/bin/env bash

set -xeu

INT_PY_VERSIONS=${PY_VERSIONS:-"empty"}

if [ "$INT_PY_VERSIONS" == "empty" ]; then
  echo "Error: PY_VERSIONS not set - exiting"
  exit 1
fi

function valid_version(){
  RE="^[0-9]*\.[0-9]*\.[0-9]*$"
  if [[ "$1" =~ $RE ]]; then
    echo "Valid version found ("$1") continuing..."A
    if [ ! -f "./src/Python-${1}.tgz" ]; then
      wget -q -O ./src/Python-${1}.tgz https://www.python.org/ftp/python/${1}/Python-${1}.tgz
    fi
  else 
    echo NOT_VALID
  fi
}


echo "Preparing build environment"

if [[ ! -d src ]]; then
  mkdir src
fi

IFS=,
for VERSION in ${INT_PY_VERSIONS}
do
	echo "$VERSION"
	valid_version "$VERSION"
done


if [[ ! -d output ]]; then
  echo "Creating output directory"
  mkdir output
else
  echo "Clearing outputs"
  rm -rf output/*
fi

