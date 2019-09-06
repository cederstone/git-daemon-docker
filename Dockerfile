FROM alpine:3.10.2

RUN apk add git-daemon && \
    mkdir -p /srv/git/repo && \
    cd /srv/git/repo && \
    git init --bare .

WORKDIR /srv

ENTRYPOINT ["/usr/libexec/git-core/git-daemon", "--export-all", "--base-path=/srv/git", "--verbose", "--informative-errors", "--enable=receive-pack", "/srv/git"]
