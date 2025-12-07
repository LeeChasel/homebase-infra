#!/bin/sh
set -e

echo "[$(date)] Updating infra..."

cd /repos/infra

echo "[$(date)] Pulling latest code..."
if ! git pull origin main; then
    echo "[$(date)] Failed to pull latest code"
  exit 1
fi

echo "[$(date)] Restarting caddy..."
if ! docker restart caddy; then
    echo "[$(date)] Failed to restart caddy"
  exit 1
fi

echo "[$(date)] Infra updated successfully"