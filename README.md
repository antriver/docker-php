# Docker PHP Images

These are Dockerfiles to build images based on some PHP base images, with additional things added. Mostly intended for personal use for quick projects.


# Building and Publishing

    cd 8.1.0-cli
    docker build -t antriver/php:8.1.0-cli .
    docker push antriver/php:8.1.0-cli
