#!/bin/bash

WORKSPACE_ROOT=${ECLIPSE_WORKSPACE_ROOT}
if [ -z "${ECLIPSE_WORKSPACE_ROOT}" ]; then
    echo "Please define \$ECLIPSE_WORKSPACE_ROOT before running this script"
    exit 2
fi

docker run \
    --rm \
    -i \
    -t \
    -p 9000:9000 \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v ${HOME}/.gitconfig:${HOME}/.gitconfig \
    -v ${HOME}/.gitignore:${HOME}/.gitignore \
    -v ${HOME}/.ssh:${HOME}/.ssh \
    -v ${WORKSPACE_ROOT}:${WORKSPACE_ROOT} \
    -v ${HOME}/.eclipse:${HOME}/.eclipse \
    eclipse \
    /usr/bin/eclipse
