FROM alpine:3.24

ARG BUILD_DATE=unknown
ARG GIT_COMMIT=unknown
ARG BUILD_ENVIRONMENT=unknown

LABEL org.opencontainers.image.authors="Martin Kock <code@deeagle.de>" \
      org.opencontainers.image.url="https://github.com/deeagle/filecheck" \
      org.opencontainers.image.title="File-Control tools." \
      org.opencontainers.image.description="The tools provide file checks like UTF8 and Linefeed validation in an alpine container for CI." \
      org.opencontainers.image.vendor="deeagle.de" \
      org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.revision="${GIT_COMMIT}" \
      org.opencontainers.image.build_environment="${BUILD_ENVIRONMENT}"

RUN apk --no-cache add file git moreutils
