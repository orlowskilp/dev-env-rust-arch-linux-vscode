ARG VERSION

FROM archlinux:${VERSION}

# Needs to be defined after FROM
ARG USERNAME

RUN useradd -ms /bin/bash ${USERNAME}
# Install all the language specific packages
RUN pacman -Suy --noconfirm \
    git \
    gcc \
# Install sudo for dev container updating and debugging
    sudo && \
    pacman -Scc
# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ~/install-rust.sh && \
    chmod a+x ~/install-rust.sh && \
    ~/install-rust.sh -y && \
    /root/.cargo/bin/rustup component add rust-analysis --toolchain stable-x86_64-unknown-linux-gnu && \
    /root/.cargo/bin/rustup component add rust-src --toolchain stable-x86_64-unknown-linux-gnu && \
    /root/.cargo/bin/rustup component add rust-analyzer --toolchain stable-x86_64-unknown-linux-gnu
# Move files to user directory
RUN cp -r ~/.cargo /home/${USERNAME} && \
    chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/.cargo && \
    cp -r ~/.rustup /home/${USERNAME} && \
    chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/.rustup && \
    echo "PATH=$PATH:~/.cargo/bin" >> /home/${USERNAME}/.bash_profile && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# Set run as user
USER ${USERNAME}
WORKDIR /home/${USERNAME}