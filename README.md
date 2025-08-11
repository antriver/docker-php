# Docker PHP Images

These are PHP images built from the official PHP images with some minor additions:
- composer
- git and zip installed to support composer

Intended for use with quick projects, testing, pipelines, etc.

Each directory contains a different version.

# Building

    ./build.sh 8.4.6-cli 

# Publishing

    ./build.sh 8.4.6-cli --publish
