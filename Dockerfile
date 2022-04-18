FROM alpine:3
LABEL maintainer="deeagle <code@deeagle.de>"

RUN apk --no-cache add file git moreutils
