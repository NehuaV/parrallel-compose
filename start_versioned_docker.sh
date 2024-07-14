#!/bin/bash

# Check if version is passed as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

# if 'data' dir does not exist create it
if [ ! -d "./data" ]; then
    mkdir data
fi

# Names and version of the project
DIR_NAME=${PWD##*/}
VERSION=$1
GEN_NAME=${DIR_NAME}_$VERSION

# Enviroment File localtion
ENV_FILE="./data/.env_$GEN_NAME"

# Generate .env file
cat <<EOF >$ENV_FILE
PROJECT_NAME=$GEN_NAME
DB_CONTAINER_NAME=db_$GEN_NAME
DB_PORT=$((5432 + $VERSION))
DB_VOLUME_NAME=${PWD}/data/db_data_$GEN_NAME
EOF

# Run docker-compose
docker-compose --env-file $ENV_FILE up -d
