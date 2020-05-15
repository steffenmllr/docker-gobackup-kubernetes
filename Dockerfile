FROM alpine:3

ENV VERSION 0.8.2

RUN apk add --no-cache curl postgresql-client \
    && curl -Lo gobackup.tar.gz https://github.com/huacnlee/gobackup/releases/download/${VERSION}/gobackup-linux-amd64.tar.gz \
    && tar zxf gobackup.tar.gz && mv gobackup /usr/local/bin/gobackup && rm gobackup.tar.gz \
    && mkdir ~/.gobackup && touch ~/.gobackup/gobackup.yml

ENTRYPOINT [ "/usr/local/bin/gobackup"]
