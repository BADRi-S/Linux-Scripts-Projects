#!/bin/bash

#-----------------------------------------------------------------
# docker_monitor.sh
# Displays running Docker containers with CPU and memory usage
# Usage: ./docker_monitor.sh
#-----------------------------------------------------------------

# # Check if Docker is installed
if ! command -v docker &> /dev/null; then
  echo "‚ùå Docker is not installed. Please install Docker first."
  exit 1
fi
# Check if Docker daemon is running
if ! sudo systemctl is-active --quiet docker; then
  echo "‚ùå Docker service is not running. Starting Docker..."
  sudo systemctl start docker
fi

# Check if any containers are running
if [ "$(docker ps -q)" == "" ]; then
  echo "Ì≥¶ No running containers found."
  exit 0
fi

# Show container stats
echo "Ì≥ä Monitoring Docker containers (press Ctrl+C to stop)..."
docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"

