ARG CPU_ARCH=x86_64
FROM quay.io/pypa/manylinux_2_28_${CPU_ARCH}

ARG RHEL_CUDA_REPO

RUN dnf install -y epel-release && \
        dnf update -y && \
        yum config-manager --add-repo ${RHEL_CUDA_REPO} && \
        dnf install -y kernel-devel && \
        dnf install -y cuda libnccl libnccl-devel ucx ucx-devel

COPY ucx_cmake /usr/lib64/cmake
COPY 1337-venv-libs.conf /etc/ld.so.conf.d/

ENV CUDA_HOME="/usr/local/cuda"
ENV PATH="${PATH}:${CUDA_HOME}/bin"
