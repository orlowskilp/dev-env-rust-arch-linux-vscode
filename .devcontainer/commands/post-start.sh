#!/bin/bash

# Cheap trick to allow the container to access the host's Docker socket
DOCKER_SOCK=/var/run/docker.sock
sudo chmod 777 ${DOCKER_SOCK}

# Install Rust toolchains declared in rust-toolchain
rustup toolchain install