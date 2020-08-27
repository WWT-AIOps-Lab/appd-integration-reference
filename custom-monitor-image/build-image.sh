#!/usr/bin/env bash

IMAGE_NAME='thousandeyes/appd-monitor'
BUILD_TYPE=''

if [ "$1" = "prebuilt" ]; then
	echo "Using prebuild Dockerfile"
	BUILD_TYPE=".prebuilt"
else
	echo "Using default Dockerfile"
fi

cp -r ../custom-monitor/thousandeyes ./build/thousandeyes-monitor

docker build -t ${IMAGE_NAME} -f ./build/thousandeyes-monitor/Dockerfile${BUILD_TYPE} ./build/thousandeyes-monitor