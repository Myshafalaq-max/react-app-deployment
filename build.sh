#!/bin/bash

# Login to Docker Hub securely
printf '%s\n' "$DOCKER_PASS" | docker login --username "$DOCKER_USERNAME" --password-stdin

# Stop and remove existing container if it exists
docker rm -f react 2>/dev/null || true

# Build Docker image
docker build -t react-ci/cd .

# Run the container
docker run -d --name react -p 80:80 react-ci/cd

# Tag the image for your Docker Hub repository
docker tag react-ci/cd myshatech/react-app:ci-cd

# Push the image to Docker Hub
docker push myshatech/react-app:ci-cd
