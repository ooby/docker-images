#/bin/bash
git clone https://gitlab.com/nvidia/container-images/cuda.git
cd ./cuda

export IMAGE_NAME="nvidia/cuda"
export CUDA_VERSION="11.0"
export OS="ubuntu20.04"

docker build -t "${IMAGE_NAME}:${CUDA_VERSION}-base-${OS}" "dist/11.0/${OS}-x86_64/base"
docker build -t "${IMAGE_NAME}:${CUDA_VERSION}-runtime-${OS}" --build-arg "IMAGE_NAME=${IMAGE_NAME}" "dist/11.0/${OS}-x86_64/runtime"