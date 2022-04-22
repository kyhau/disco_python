FROM ubuntu:22.04
LABEL maintainer="virtualda@gmail.com"

RUN apt update && apt install -y \
    apt-transport-https \
    curl \
    software-properties-common \
    wget

# Install commonly used base packages
RUN apt update && apt install -y \
    build-essential=12.6\* \
    cmake=3.13.\* \
    g++=4:8.3.\* \
    gcc=4:8.3.\* \
    git=1:2.20.\* \
    libatlas3-base=3.10.\* \
    libffi-dev=3.2.\* \
    libgeos++-dev=3.7.\* \
    libgif-dev=5.1.\* \
    libhdf4-alt-dev=4.2.\* \
    liblapack3=3.8.\* \
    libnetcdf-dev=1:4.6.\* \
    libpq-dev=11.5\* \
    libproj-dev=5.2.\* \
    libssl-dev=1.1.\* \
    libxerces-c-dev=3.2.\* \
    make=4.\* \
    pandoc=2.2.\*

################################################################################
# Install Python

RUN apt install -y \
    python3.7-dev \
    python3-dev=3.7.\*

# TODO Install python 3.8

# Install pip via PyPA's recommended way rather than the outdated apt repos
# See: https://pip.pypa.io/en/stable/installing/
RUN curl https://bootstrap.pypa.io/get-pip.py -o ./get-pip.py && \
    python3.7 get-pip.py

# Upgrade pip and install virtualenv
# Default pip is python3.7 version
RUN python3.7 -m pip install -U pip virtualenv virtualenvwrapper wheel

################################################################################
# Install docker

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu disco stable"

RUN apt update && apt install -y \
    docker-ce=5:19.\*


CMD ["/bin/bash"]
