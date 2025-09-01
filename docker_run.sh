#!/usr/bin/env bash
set -euo pipefail

IMAGE=${1:-rvrt}


docker run --rm -it \
  -v "${PWD}:/workspace" \
  --gpus all \
  --ipc=host \
  -e PYTORCH_CUDA_ALLOC_CONF="max_split_size_mb:128" \
  -e CUDA_VISIBLE_DEVICES=0 \
  -w /workspace \
  --name rvrt-dev \
  "$IMAGE" \
  bash