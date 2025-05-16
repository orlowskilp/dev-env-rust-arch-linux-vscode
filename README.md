# Rust development environment for VSCode

[![License](https://img.shields.io/badge/license-MIT-green)](./LICENSE)
[![Rust dev env verification](https://github.com/orlowskilp/dev-env-rust-arch-linux-vscode/actions/workflows/pipeline.yml/badge.svg?branch=master)](https://github.com/orlowskilp/dev-env-rust-arch-linux-vscode/actions/workflows/pipeline.yml)

This template provides a Rust development environment for Visual Studio Code. The development container is based on the Arch Linux image.

## Getting started

1. Install [Visual Studio Code](https://code.visualstudio.com/)
2. Install [Docker](https://www.docker.com/)
3. In VSCode go to *Extensions* and install the *Dev Containers* extension
4. Open the project directory (the one with `.devcontainer` subdirectory in it)
5. VSCode will prompt you to reopen the folder in container. Alternatively you can go to *View > Commands Palette* and look up *Open Folder in Container*

## Tool Chains

The set up is built with the following tool chains in mind and supports cross-compilation:

* `x86_64-unknown-linux-gnu`
* `x86_64-unknown-linux-musl`
* `aarch64-unknown-linux-gnu`
* `aarch64-unknown-linux-musl`

You should set the active tool chain to the one matching your platform.

## Selecting tool chain and build target

You can select your toolchain using the `RUSTUP_TOOLCHAIN` variable, e.g.:

```shell
RUSTUP_TOOLCHAIN=1.85 make build
```

You set the build target using `CARGO_BUILD_TARGET` variable, e.g.:

```shell
CARGO_BUILD_TARGET=x86_64-unknown-linux-musl make build
```
