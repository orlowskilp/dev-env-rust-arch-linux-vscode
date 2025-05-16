#!/bin/bash

# Add the current directory to the list of safe directories for Git
# to avoid warnings when using Git in the container
git config --global --add safe.directory $(pwd)