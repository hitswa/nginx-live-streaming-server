#!/bin/bash

# Check if Docker Compose is installed
if ! command -v docker compose &> /dev/null; then
    echo "Docker Compose is not installed. Please install Docker Compose."
    exit 1
fi

# Check if Docker is running
if ! docker info &> /dev/null; then
    echo "Docker is not running. Please start Docker."
    exit 1
fi

# Set the directory where the docker-compose.yml file is located
COMPOSE_DIR="."

# Execute Docker Compose
docker compose -f "${COMPOSE_DIR}/docker-compose.yml" up -d

# Wait for nginx-rtmp container to be available
while ! docker exec nginx-rtmp true &> /dev/null; do
    echo "Waiting for nginx-rtmp container to be available..."
    sleep 1
done

# Execute htpasswd command within the nginx-rtmp container
docker exec nginx-rtmp htpasswd -c -b /etc/nginx/.htpasswd admin admin