FROM alpine:3.21
LABEL org.opencontainers.image.authors="Martin Kock <code@deeagle.de>" \
      org.opencontainers.image.url="https://github.com/deeagle/filecheck" \
      org.opencontainers.image.title="File-Control tools." \
      org.opencontainers.image.description="The tools provide file checks like UTF8 and Linefeed validation in an alpine container for CI." \
      org.opencontainers.image.vendor="deeagle.de"

RUN apk --no-cache add file git moreutils
