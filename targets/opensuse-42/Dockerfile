FROM opensuse/leap:42.3

ENV OS_IDENTIFIER=opensuse-42

RUN zypper --non-interactive update

RUN zypper --non-interactive --gpg-auto-import-keys install \
    automake \
    fdupes \
    gcc \
    gcc-c++ \
    gcc-fortran \
    gdbm-devel \
    gettext-tools \
    gmp-devel \
    gzip \
    intltool \
    libbz2-devel \
    libexpat-devel \
    libffi-devel \
    libnsl-devel \
    lzma-devel \
    make \
    ncurses-devel \
    netcfg \
    openssl-devel \
    pkgconfig \
    readline-devel \
    rpm-build \
    sqlite-devel \
    tar \
    xz \
    zlib-devel \
    ruby \
    ruby-devel \
    && zypper clean

# Pin fpm for compatibility with Ruby < 2.3
# https://github.com/rstudio/r-builds/blob/d07acfe0cdb68fa99331ec1b12e92b169c05d447/builder/Dockerfile.opensuse-42#L72
RUN gem install ffi:1.12.2 fpm:1.11.0 && \
    ln -s /usr/bin/fpm.ruby2.1 /usr/local/bin/fpm

COPY build.sh /build.sh
ENTRYPOINT [ "/build.sh" ]
CMD []