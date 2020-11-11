FROM centos:centos8

ENV OS_IDENTIFIER=centos-8

RUN sed -i 's/^enabled=0/enabled=1/g' /etc/yum.repos.d/CentOS-PowerTools.repo && yum -y update

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

