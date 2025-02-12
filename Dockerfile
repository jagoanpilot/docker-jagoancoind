FROM debian:stable-slim
LABEL maintainer="Luke Childs <lukechilds123@gmail.com>"

COPY ./bin /usr/local/bin
COPY ./VERSION /tmp
COPY ./CHECKSUM /tmp

RUN VERSION=`cat /tmp/VERSION` && \
    chmod a+x /usr/local/bin/* && \
    apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates unzip && \
    curl -L https://github.com/jagoanpilot/qt/releases/download/$VERSION/jagoancoind-v$VERSION-linux-amd64.zip --output /tmp/prebuilt.zip && \
    echo "$(cat /tmp/CHECKSUM)  /tmp/prebuilt.zip" | sha256sum -c && \
    unzip /tmp/prebuilt.zip -d /tmp && \
    mv /tmp/jagoancoind /usr/local/bin && \
    apt-get purge -y curl ca-certificates unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/data"]
ENV HOME /data
ENV DATA /data
WORKDIR /data

EXPOSE 17898 17899

ENTRYPOINT ["init"]
