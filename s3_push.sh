#/usr/bin/env bash

set -xeu

s3cmd sync ${OUTPUT_PATH} ${S3_PATH}
