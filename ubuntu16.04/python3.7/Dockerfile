# Base image
FROM ubuntu:16.04

# Informations
MAINTAINER "Toshiki Ohnogi, @toshikiohnogi, thetoshiki0419@gmail.com"

# Install required packages
RUN apt-get update && \
    apt-get upgrade -y && \ 	
    apt-get install -y \
      git \
      vim \
      tzdata \
      nginx \
      supervisor \
      build-essential \
      wget \
      libssl-dev \
      libbz2-dev \
      libreadline-dev \
      libffi-dev \
      zlib1g-dev \
      libmysqlclient-dev \
      sqlite3 \
      libsqlite3-dev && \
    rm -rf /var/lib/apt/lists/*

# Set time zone JST
RUN export DEBIAL_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Setup pyenv (but any commands unable to use)
RUN git clone git://github.com/yyuu/pyenv.git ~/.pyenv
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile && \
    echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

# Setup python 3.7 environment and install uwsgi
RUN /bin/bash -c "source ~/.bash_profile && \
                  pyenv install 3.7.0 && \
                  pyenv global 3.7.0 && \
                  pip3 install -U pip setuptools && \
                  pip install uwsgi"
