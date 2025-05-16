ARG TARGET=x86_64-unknown-linux-gnu

# You will most likely want to use multistage builds, hence "AS builder"
FROM archlinux:latest AS builder

# Reimport the build arguments
ARG TARGET

ARG BUILD_DIR=/tmp/build

# Install dependencies and clean up the cache
RUN pacman -Suy --noconfirm \
    make \
    gcc \
    musl \
    musl-aarch64 \
    aarch64-linux-gnu-gcc

# Install rust with the specified toolchain and target
ENV CARGO_BUILD_TARGET=${TARGET}
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --target ${CARGO_BUILD_TARGET} --profile minimal

# Set up the environment with all the supported targets
ENV PATH=$PATH:/root/.cargo/bin \
    CC_X86_64_UNKNOWN_LINUX_GNU=gcc \
    CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc \
    CC_X86_64_UNKNOWN_LINUX_MUSL=musl-gcc \
    CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER=musl-gcc \
    CC_AARCH64_UNKNOWN_LINUX_GNU=aarch64-linux-gnu-gcc \
    CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc \
    CC_AARCH64_UNKNOWN_LINUX_MUSL=aarch64-linux-musl-gcc \
    CARGO_TARGET_AARCH64_UNKNOWN_LINUX_MUSL_LINKER=aarch64-linux-musl-gcc

WORKDIR ${BUILD_DIR}
COPY . .

RUN make build