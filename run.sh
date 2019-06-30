#!/usr/bin/env bash

function docker_build(){
docker build -t py-build:ubuntu-1804 ./targets/ubuntu-1804/
}

function docker_run() {
docker run -v ${PWD}/output:/opt/python -v ${PWD}/src:/src py-build:ubuntu-1804 ${BUILD_NUMBER}
}

if [[ ${1} == "run" ]]; then
docker_run
exit
fi


if [[ ${1} == "build" ]]; then
docker_build
exit
fi

if [[ ${1} == "all" ]]; then
docker_build
docker_run
exit
fi

echo "use parameter, 'build', 'run' or 'all' to continue"
exit 1
