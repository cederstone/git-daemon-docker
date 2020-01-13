FROM alpine:3.10.2

RUN apk add git-daemon && \
    mkdir -p /srv/git/repo && \
    cd /srv/git/repo && \
    mkdir -p /srv/git/owner/repo && \
    cd /srv/git/owner/repo && \
    git init --bare .

WORKDIR /srv

CMD ["/usr/libexec/git-core/git-daemon", "--export-all", "--base-path=/srv/git", "--verbose", "--informative-errors", "--enable=receive-pack", "--listen=0.0.0.0", "--port=9418", "/srv/git"]
