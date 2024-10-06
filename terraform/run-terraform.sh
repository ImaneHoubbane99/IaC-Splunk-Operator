#!/bin/bash

# Build the Docker image
docker build -t terraform-azure .


# Check if .env file exists
if [ ! -f ".env" ]; then
  echo ".env file not found!"
  exit 1
fi

# Get the Windows-style absolute path for the current directory
CURRENT_DIR=$(pwd)

# Run Docker with the correct Windows path
docker run -it \
  -v "$CURRENT_DIR:/workspace" \
  -w /workspace \
  --env-file .env \
  terraform-azure $1


