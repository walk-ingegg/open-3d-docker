# This could also be another Ubuntu or Debian based distribution
FROM ubuntu:22.04

# Update and install required packages
RUN apt-get update && apt-get install --no-install-recommends -y \
    libegl1 \
    libgl1 \
    libgomp1 \
    python3-pip \
    locales \
    && rm -rf /var/lib/apt/lists/*

# Setup timezone and locale
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN locale-gen ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# Create working directory
RUN mkdir -p /root/src
COPY requirements.txt /root/src
WORKDIR /root/src

# Install Python packages
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install --no-cache-dir --upgrade open3d
RUN pip install -r requirements.txt
