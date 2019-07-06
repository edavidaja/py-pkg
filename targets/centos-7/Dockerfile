FROM centos:centos7

ENV OS_IDENTIFIER=centos-7

RUN yum -y update

RUN yum -y install \
  wget \
  gcc \
  make \
  rpm-build \
  zlib-devel \
  bzip2-devel \
  ncurses-devel \
  tk-devel \
  tix-devel \
  libffi-devel \
  libxml2-devel \
  openssl-devel \
  readline-devel \
  ruby \ 
  ruby-devel \
  && yum clean all

RUN gem install fpm

COPY build.sh /build.sh

ENTRYPOINT ["/build.sh"]
CMD []

