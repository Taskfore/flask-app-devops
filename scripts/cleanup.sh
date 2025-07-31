#!/bin/bash

echo "Cleaning up..."

read -p "This will remove all containers, images, and volumes. Continue? (y/N): " confirm

if [[ $confirm == [yY] ]]; then
    docker-compose down -v --rmi all
    docker system prune -f
    echo "Cleanup done."
else
    echo "Cleanup canceled."
fi
