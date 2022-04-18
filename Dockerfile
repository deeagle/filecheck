FROM alpine:3
LABEL maintainer="deeagle <code@deeagle.de>"
LABEL about="Container to execute file checks."

RUN apk --no-cache add file git moreutils
