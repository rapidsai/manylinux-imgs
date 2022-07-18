ARG CPU_ARCH=x86_64
FROM quay.io/pypa/manylinux_2_28_${CPU_ARCH}

ARG RHEL_CUDA_REPO

# copy install-build-requirements script
COPY install-build-requirements.sh /install-build-requirements.sh

RUN dnf install -y epel-release && \
        dnf update -y && \
        yum config-manager --add-repo ${RHEL_CUDA_REPO} && \
        dnf install -y kernel-devel && \
        dnf install -y cuda libnccl libnccl-devel && \
        dnf install -y ucx ucx-devel

ENV CUDA_HOME="/usr/local/cuda"
ENV PATH="${PATH}:${CUDA_HOME}/bin"
