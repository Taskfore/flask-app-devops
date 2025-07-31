#!/bin/bash

echo "Starting deployment..."

# Stop and remove existing containers, if any
docker-compose down

# Build images and start containers in detached mode
docker-compose up --build -d

echo "Application deployed at http://localhost:5000"
