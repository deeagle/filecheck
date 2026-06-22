FROM alpine:3.24@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

ARG BUILD_DATE="unknown"
ARG GIT_COMMIT="unknown"
ARG BUILD_ENVIRONMENT="unknown"

LABEL org.opencontainers.image.authors="Martin Kock-Faltin code@deeagle.de" \
      org.opencontainers.image.url="https://github.com/deeagle/filecheck" \
      org.opencontainers.image.title="File-Control tools." \
      org.opencontainers.image.description="The tools provide file checks like UTF8 and Linefeed validation in an alpine container for CI." \
      org.opencontainers.image.vendor="deeagle.de" \
      org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.revision="${GIT_COMMIT}" \
      org.opencontainers.image.build_environment="${BUILD_ENVIRONMENT}"

RUN apk --no-cache add file git moreutils
