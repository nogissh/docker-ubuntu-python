FROM ubuntu:20.04

LABEL mentainer "nogissh, me@nogissh.com"

ENV HOME /root

RUN apt-get update && \
    apt-get upgrade -y 

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y \
        git \
        vim \
        nginx \
        wget \
        cron \
        build-essential \
        libssl-dev \
        libbz2-dev \
        libreadline-dev \
        libffi-dev \
        zlib1g-dev \
        sqlite3 \
        libsqlite3-dev \
        libmysqlclient-dev
RUN rm -rf /var/lib/apt/lists/*

# Setup Python 3.12
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH
RUN eval "$(pyenv init -)"
RUN pyenv install 3.12.5 && \
    pyenv global 3.12.5
ENV PATH $PYENV_ROOT/shims:$PATH
