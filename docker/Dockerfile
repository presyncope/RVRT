FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-devel

SHELL ["/bin/bash", "-lc"]

ENV DEBIAN_FRONTEND=noninteractive

# NVIDIA CUDA apt repo 목록 제거 → GPG 오류 방지
RUN rm -f /etc/apt/sources.list.d/cuda*.list /etc/apt/sources.list.d/nvidia*.list || true && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        git build-essential libgl1-mesa-glx libglib2.0-0 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# conda init 및 항상 base 활성화
RUN conda init bash && echo "conda activate base" >> ~/.bashrc

# 파이썬 의존성 설치
RUN pip install --no-cache-dir \
    addict \
    future \
    numpy \
    opencv-python \
    Pillow \
    pyyaml \
    requests \
    scikit-image \
    scipy \
    timm==0.6.13 \
    einops \
    ninja \
    matplotlib

ENV TORCH_CUDA_ARCH_LIST="6.0;7.0;7.5;8.0;8.6"

WORKDIR /workspace