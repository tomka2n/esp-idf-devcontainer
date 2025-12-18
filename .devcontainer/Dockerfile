# syntax=docker/dockerfile:1
ARG ESP_IDF_VERSION="v5.5.1"
# https://hub.docker.com/r/espressif/idf/tags
FROM espressif/idf:${ESP_IDF_VERSION}

USER root
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --no-install-recommends usbutils && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*
RUN usermod -a -G dialout ubuntu

USER ubuntu
WORKDIR /home/ubuntu
COPY --chmod=644 --chown=ubuntu:ubuntu /scripts/.bashrc /home/ubuntu/.bashrc
COPY --chmod=755 --chown=ubuntu:ubuntu /scripts/init_esp-idf.sh /home/ubuntu/.config/init_esp-idf.sh
