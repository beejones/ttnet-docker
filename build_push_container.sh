#!/bin/bash

# Ensure the script exits if any command fails
set -e

# Check if required environment variables are set
if [ -z "$DOCKER_USERNAME" ] || [ -z "$DOCKER_PASSWORD" ] || [ -z "$DOCKER_REPO" ]; then
  echo "Error: DOCKER_USERNAME, DOCKER_PASSWORD, and DOCKER_REPO environment variables must be set."
  exit 1
fi

# Log in to Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Build the Docker image
docker-compose build

# Tag the Docker image
docker tag ttnet:latest "$DOCKER_USERNAME/$DOCKER_REPO:latest"

# Push the Docker image to Docker Hub
docker push "$DOCKER_USERNAME/$DOCKER_REPO:latest"

# Log out from Docker Hub
docker logout

echo "Docker image pushed to Docker Hub $DOCKER_USERNAME/$DOCKER_REPO:latest successfully."