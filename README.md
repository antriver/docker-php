# Docker PHP Images

These are Dockerfiles to build images based on official PHP base images with some additions such as:
- composer
- 
Intended for use with quick project, testing, pipelines, etc.

Each directory contains a different version.

# Building

    ./build.sh 8.4.4-cli

# Publishing

    ./build.sh 8.4.4-cli --publish
