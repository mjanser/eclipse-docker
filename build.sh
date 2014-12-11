#!/bin/bash

eval echo "\"$(cat <<EOF
$(<Dockerfile)
EOF
)\"" | docker build -t eclipse -
