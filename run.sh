#!/usr/bin/env bash

set -xeu

echo "Run script starting..."

BUILD_NO=${1:-default}
if [[ ${BUILD_NO} == "default" ]]; then
  echo "Missing build number"
  exit 1
fi

function docker_build(){
docker build -t py-build:ubuntu-1804 ./targets/ubuntu-1804/
}

function docker_run() {
docker run -v ${PWD}/output:/opt/python -v ${PWD}/src:/src py-build:ubuntu-1804 ${1}
}

if [[ ${1} == "run" ]]; then
docker_run ${BUILD_NO}
exit
fi


if [[ ${1} == "build" ]]; then
docker_build
exit
fi

if [[ ${1} == "all" ]]; then
docker_build
docker_run ${BUILD_NO}
exit
fi

echo "use parameter, 'build', 'run' or 'all' to continue"
exit 1
