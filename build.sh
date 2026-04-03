#!/usr/bin/env bash
set -euo pipefail

IMAGE="ghcr.io/dzfranklin/os-leisure-reprojector"
PUSH=false

for arg in "$@"; do
  case $arg in
    --push) PUSH=true ;;
    *) echo "Unknown argument: $arg"; exit 1 ;;
  esac
done

docker build --platform linux/amd64 -t "$IMAGE:latest" .

if [ "$PUSH" = true ]; then
  docker push "$IMAGE:latest"
fi
