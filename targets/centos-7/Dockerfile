FROM centos:centos7

ENV OS_IDENTIFIER=centos-7

# RUN sed -i 's/^enabled=0/enabled=1/g' /etc/yum.repos.d/CentOS-Linux-PowerTools.repo && yum -y update

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
  sqlite-devel \
  ruby \ 
  ruby-devel \
  && yum clean all

# Pin fpm for compatibility with Ruby < 2.3
RUN gem install ffi:1.12.2 fpm:1.11.0

COPY build.sh /build.sh

ENTRYPOINT ["/build.sh"]
CMD []

