ARG VERSION

FROM archlinux:${VERSION}

# Needs to be defined after FROM
ARG USERNAME
ARG CARGO_BIN=/root/.cargo/bin/
ARG HOME_DIR=/home/${USERNAME}
ARG RUST_INSTALLER=install-rust.sh

RUN useradd -ms /bin/bash ${USERNAME}
# Install all the language specific packages
RUN pacman -Suy --noconfirm \
    git \
    gcc \
# Install Docker CLI
    docker \
# Install sudo for dev container updating and debugging
    sudo && \
    pacman -Scc
# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ~/${RUST_INSTALLER} && \
    chmod a+x ~/install-rust.sh && \
    ~/${RUST_INSTALLER} -y && \
    ${CARGO_BIN}/rustup component add rust-analysis --toolchain stable-x86_64-unknown-linux-gnu && \
    ${CARGO_BIN}/rustup component add rust-src --toolchain stable-x86_64-unknown-linux-gnu && \
    ${CARGO_BIN}/rustup component add rust-analyzer --toolchain stable-x86_64-unknown-linux-gnu && \
    ${CARGO_BIN}/rustup component add llvm-tools-preview --toolchain stable-x86_64-unknown-linux-gnu && \
    ${CARGO_BIN}/cargo install cargo-llvm-cov
# Move files to user directory
RUN mv ~/.cargo /home/${USERNAME} && \
    chown -R ${USERNAME}:${USERNAME} ${HOME_DIR}/.cargo && \
    mv ~/.rustup /home/${USERNAME} && \
    chown -R ${USERNAME}:${USERNAME} ${HOME_DIR}/.rustup && \
    mv ~/.profile /home/${USERNAME} && \
    chown -R ${USERNAME}:${USERNAME} ${HOME_DIR}/.profile && \
    echo "PATH=$PATH:~/.cargo/bin" >> ${HOME_DIR}/.bash_profile && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    rm ~/${RUST_INSTALLER}
# Set run as user
USER ${USERNAME}
WORKDIR ${HOME_DIR}