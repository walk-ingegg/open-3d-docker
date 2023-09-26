# This could also be another Ubuntu or Debian based distribution
FROM ubuntu:22.04

# Install Open3D system dependencies and pip
RUN apt-get update && apt-get install --no-install-recommends -y \
    libegl1 \
    libgl1 \
    libgomp1 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN mkdir -p /root/src
COPY requirements.txt /root/src
WORKDIR /root/src

# Install Open3D from the PyPI repositories
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install --no-cache-dir --upgrade open3d
RUN pip install -r requirements.txt
