# Quick script to configure a server ready for creating py-pkg builds
# To be executed with bash <(curl ... )  

# Check we're in the correct OS
if ! grep '^VERSION_ID="20.04"$' /etc/os-release ; then
  echo "This script was intended for Ubuntu 20.04 only!"
  exit 1
fi

# Install useful packages
sudo apt update
sudo apt install -y \
    curl \
    docker.io \
    docker-compose \
    git \
    htop \
    make \
    s3cmd \
    screen \
    tree \
    ;


# Project config
git clone https://github.com/sellorm/py-pkg.git

cat <<EOF > ./py-pkg/.env_build
export PY_VERSIONS=3.9.7,3.8.12,3.7.11,3.6.14
export BUILD_NUMBER=1235
export S3_PATH=""
export OUTPUT_PATH="output/"
EOF

# AWS config
mkdir ~/.aws
cat <<EOF > ~/.aws/config
[default]
region = eu-west-1
EOF

cat <<EOF > ~/.aws/credentials
[default]
aws_access_key_id = 
aws_secret_access_key = 
EOF

# add our user to the docker group
sudo usermod -aG docker $USER
newgrp - docker

