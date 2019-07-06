#!/usr/bin/env bash

set -xeu

echo "Run script starting..."

INPUT=${1:-"empty"}
IFS=,

function docker_build(){
# docker build -t py-build:ubuntu-1804 ./targets/ubuntu-1804/
docker-compose build
}

function docker_run() {
# docker run -v ${PWD}/output:/opt/python -v ${PWD}/src:/src py-build:ubuntu-1804 ${1}
for VERSION in ${PY_VERSIONS}
do
export VERSION=${VERSION}
docker-compose up
done
}


if [[ ${INPUT} == "run" ]]; then
docker_run 
exit
fi


if [[ ${INPUT} == "build" ]]; then
docker_build
exit
fi

if [[ ${INPUT} == "all" ]]; then
docker_build
docker_run
exit
fi

echo "use parameter, 'build', 'run' or 'all' to continue"
exit 1
