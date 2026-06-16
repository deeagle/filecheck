#!/usr/bin/env bash

set -e
set +x

echo "Running local CI ..."

echo "Running lints ..."

echo "Lint markdown ..."
docker run --rm -v "$(pwd):/app" docdee/mdlint -c /app/.markdownlint.yml -i CHANGELOG.md "**/*.md"

echo "Lint shell scripts ..."
docker run --rm -v "$(pwd):/app" koalaman/shellcheck-alpine:stable find /app -type f -name '*.sh' -exec shellcheck {} +

echo "Lint Dockerfiles ..."
docker_linter_version="$(docker run --rm -i ghcr.io/hadolint/hadolint hadolint -v)"
echo "Using docker-linter version: ${docker_linter_version}"
dockerfiles=$(find . -type f -name "*Dockerfile" -not -path "./vendor/*" -not -path "./tmp/*")
for dockerfile in ${dockerfiles}; do
  echo "> lint file: $dockerfile"
  docker run --rm -i -v "${PWD}/.hadolint.yml:/.config/hadolint.yml" ghcr.io/hadolint/hadolint < "$dockerfile"
done

echo "CI successfully finished."
