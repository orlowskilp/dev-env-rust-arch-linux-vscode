# Rust development environment for VSCode

[![License](https://img.shields.io/badge/license-MIT-green)](./LICENSE)

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
