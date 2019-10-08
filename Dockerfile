FROM alpine:3.10.2
MAINTAINER Cao Yang <caoy83@qq.io>

# cf Version
ENV CF_VERSION 6.46.1

# Download and unarchive Maven
RUN apk add --update curl &&\
  mkdir -p /opt/cf-cli &&\
  curl https://s3-us-west-1.amazonaws.com/cf-cli-releases/releases/v6.46.1/cf-cli_6.46.1_linux_x86-64.tgz -o cf-cli.tgz &&\
  gunzip -c cf-cli.tgz | tar -xf - -C /opt/cf-cli && rm -f cf-cli.tgz &&\
  apk del curl &&\
  rm -rf /var/cache/apk/*

# Set environment
ENV CF_HOME /opt/cf-cli
ENV PATH ${PATH}:${CF_HOME}
