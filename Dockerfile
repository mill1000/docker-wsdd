FROM alpine:latest
RUN apk add --update python3 tini
COPY wsdd/src/wsdd.py /usr/local/bin/wsdd
RUN adduser -D -H wsdd
USER wsdd
ENV OPTIONS=
EXPOSE 3702/udp
EXPOSE 5357/tcp
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/bin/sh", "-c", "/usr/local/bin/wsdd $OPTIONS"]