# syntax=docker/dockerfile:1
ARG ESP_IDF_VERSION="v5.5"
# https://hub.docker.com/r/espressif/idf/tags
FROM espressif/idf:release-${ESP_IDF_VERSION}

USER root
RUN usermod -a -G dialout ubuntu

USER ubuntu
WORKDIR /home/ubuntu
COPY --chmod=644 --chown=ubuntu:ubuntu /scripts/.bashrc /home/ubuntu/.bashrc
COPY --chmod=755 --chown=ubuntu:ubuntu /scripts/init_esp-idf.sh /home/ubuntu/.config/init_esp-idf.sh
