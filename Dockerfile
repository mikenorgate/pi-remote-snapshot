FROM alpine

RUN apk upgrade && apk add --no-cache bash openssh-client util-linux parted e2fsprogs-extra xz gzip

RUN wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh -O /pishrink.sh && chmod +x /pishrink.sh

COPY snapshot.sh /snapshot.sh

RUN chmod +x /snapshot.sh

ENTRYPOINT [ "/snapshot.sh" ]