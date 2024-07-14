#!/bin/bash

# Source common variables
source ./tools/common_variables.sh $1

# if 'data' dir does not exist create it
if [ ! -d "./data" ]; then
    mkdir data
fi

# Generate .env file
cat <<EOF >$ENV_FILE
PROJECT_NAME=$GEN_NAME
DB_CONTAINER_NAME=db_$GEN_NAME
DB_PORT=$((5432 + $VERSION))
DB_VOLUME_NAME=${PWD}/data/db_data_$GEN_NAME
EOF

# Run docker-compose
docker-compose --env-file $ENV_FILE up -d
