FROM alpine:3.7

ARG hugo_version=0.42.2
ENV HUGO_VERSION $hugo_version

RUN apk add --no-cache curl

RUN curl -O -L --silent https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar xvf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv hugo /usr/local/bin

VOLUME /src
VOLUME /output

EXPOSE 1313

COPY ./entrypoint.sh /entrypoint.sh

WORKDIR /src

CMD ["/entrypoint.sh"]