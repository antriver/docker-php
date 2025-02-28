#!/bin/bash

# Exit on error.
set -e

# Get the requested version from the first argument.
VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

# Check a directory exists for the version.
if [ ! -d $VERSION ]; then
  echo "Directory $VERSION does not exist"
  exit 1
fi

cd $VERSION

TAG=antriver/php:$VERSION

docker build --no-cache -t $TAG .

# Check the reported PHP version.
REPORTED_VERSION=$(docker run --rm $TAG php -r 'echo PHP_VERSION;')

# Check that the reported version matches the beginning of the requested version.
if [[ $VERSION == $REPORTED_VERSION* ]];
then
  echo "Reported PHP version $REPORTED_VERSION matches requested version $VERSION"
else
  echo "Reported PHP version $REPORTED_VERSION does not match requested version $VERSION"
  exit 1
fi

# Check if --publish flag is present
if [[ " $* " == *" --publish "* ]]; then
  # Push the latest versioned images to Docker Hub.
  echo "Publishing $TAG"
  docker image push $TAG
fi
