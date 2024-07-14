#!/bin/bash

# Source common variables
source ./src/common_variables.sh $1

# Stop and remove containers and volumes
docker-compose --env-file $ENV_FILE down -v

# Remove the bind-mounted volume directory
DB_DATA_DIR="${PWD}/data/db_data_${GEN_NAME}"
if [ -d "$DB_DATA_DIR" ]; then
    rm -rf "$DB_DATA_DIR"
    echo "Removed bind-mounted volume directory: $DB_DATA_DIR"
fi

# Remove the .env file
if [ -f "$ENV_FILE" ]; then
    rm "$ENV_FILE"
    echo "Removed .env file: $ENV_FILE"
fi
