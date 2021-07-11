FROM alpine

RUN apk upgrade --no-cache && \
    apk add --update --no-cache bash coreutils openssh-client util-linux parted e2fsprogs-extra xz gzip && \
    rm -rf /var/cache/apk/*

RUN wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh -O /pishrink.sh && chmod +x /pishrink.sh

COPY snapshot.sh /snapshot.sh

RUN chmod +x /snapshot.sh

ENTRYPOINT [ "/snapshot.sh" ]