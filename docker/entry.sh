#!/bin/bash

set -eux

if [ -z ${AWS_ACCESS_KEY_ID+x} ]; then
  echo "You must set your AWS_ACCESS_KEY_ID"
  exit 1
fi

if [ -z ${AWS_SECRET_ACCESS_KEY+x} ]; then
  echo "You must set your AWS_SECRET_ACCESS_KEY"
  exit 1
fi

if [ -z ${AWS_REGION+x} ]; then
  echo "You must set your AWS_REGION"
  exit 1
fi

if [ -z ${GEMINABOX_S3_KEY_PREFIX+x} ]; then
  echo "You must set your GEMINABOX_S3_KEY_PREFIX"
  exit 1
fi

if [ -z ${GEMINABOX_S3_BUCKET_NAME+x} ]; then
  echo "You must set your GEMINABOX_S3_BUCKET_NAME"
  exit 1
fi

cd docker

rackup --host 0.0.0.0
