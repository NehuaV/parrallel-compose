#!/bin/bash

# Check if version is passed as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

# Names and version of the project
DIR_NAME=${PWD##*/}
VERSION=$1
GEN_NAME=${DIR_NAME}_$VERSION

# Environment File location
ENV_FILE="./data/.env_$GEN_NAME"
