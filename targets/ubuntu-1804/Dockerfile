FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
  wget \
  ;

RUN apt-get install -y \
  gcc \
  make \
  zlib1g-dev \
  libbz2-dev \
  libncurses-dev \
  libgdbm-dev \
  liblzma-dev \
  libsqlite3-dev \
  libssl-dev \
  tk-dev \
  libreadline-dev \
  ruby \ 
  ruby-dev \
  ;

RUN gem install fpm

COPY build.sh /build.sh

ENTRYPOINT /bin/bash /build.sh
CMD []
