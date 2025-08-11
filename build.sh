#!/bin/bash

# Usage: ./build.sh <version> [--publish]
# Examples:
#   ./build.sh 8.4.11-cli
#   ./build.sh 7.0.33-cli --publish

# Exit on error.
set -e

# Get the requested version from the first argument.
VERSION=$1
if [ -z "$VERSION" ]; then
  echo "❌ Usage: $0 <version-type> [--publish]"
  echo "   Version must end with -cli or -fpm"
  echo "📋 Available versions:"
  find . -maxdepth 1 -type d -name "*-*" | sed 's|./||' | sort
  exit 1
fi

# Validate that version ends with -cli or -fmp
if [[ ! "$VERSION" =~ -(cli|fpm)$ ]]; then
  echo "❌ Error: Version must end with -cli or -fpm"
  echo "   Example: 8.4.11-cli or 8.1.0-fpm"
  exit 1
fi

# Extract the type (cli or fpm)
TYPE="${VERSION##*-}"

TAG=antriver/php:$VERSION

# 🔍 Check if specific Dockerfile exists, otherwise use template
if [ -d "$VERSION" ] && [ -f "$VERSION/Dockerfile" ]; then
  echo "📁 Using specific Dockerfile for $VERSION"
  cd $VERSION
  docker build --platform linux/amd64,linux/arm64 --no-cache -t $TAG .
  cd ..
else
  echo "🎯 Using generic $TYPE template for $VERSION"
  # Create temporary Dockerfile from template
  sed "s/\${PHP_VERSION}/$VERSION/g" templates/$TYPE/Dockerfile > Dockerfile.tmp
  docker build --platform linux/amd64,linux/arm64 --no-cache -f Dockerfile.tmp -t $TAG --build-arg PHP_VERSION=$VERSION .
  rm Dockerfile.tmp
fi

# ✅ Check the reported PHP version.
echo "🔍 Verifying PHP version..."
REPORTED_VERSION=$(docker run --rm $TAG php -r 'echo PHP_VERSION;')

# Check that the reported version matches the beginning of the requested version.
if [[ $VERSION == $REPORTED_VERSION* ]]; then
  echo "✅ Reported PHP version $REPORTED_VERSION matches requested version $VERSION"
else
  echo "❌ Reported PHP version $REPORTED_VERSION does not match requested version $VERSION"
  exit 1
fi

echo "🎉 Successfully built $TAG"

# Check if --publish flag is present
if [[ " $* " == *" --publish "* ]]; then
  echo "🚀 Publishing $TAG to Docker Hub..."
  docker image push $TAG
  echo "✅ Published successfully!"
fi
