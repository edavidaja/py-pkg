#!/usr/bin/env bash

set -xeu

echo "Run script starting..."

INPUT=${1:-"empty"}
IFS=,

function docker_build(){
docker-compose build
}

function docker_run() {
for VERSION in ${PY_VERSIONS}
do
export VERSION=${VERSION}
docker-compose up
done
}

function docker_run_single() {
TARGET=${1-default}
if [ "$TARGET" == "default" ]; then
  echo "Error: You must specify a valid docker-compose target"
  exit 1
fi
for VERSION in ${PY_VERSIONS}
do
export VERSION=${VERSION}
docker-compose up "$TARGET"
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

if [[ ${INPUT} == "single" ]]; then
docker_run_single "${2-default}"
exit
fi

if [[ ${INPUT} == "all" ]]; then
docker_build
docker_run
exit
fi

echo "use parameter, 'build', 'run' or 'all' to continue"
exit 1
