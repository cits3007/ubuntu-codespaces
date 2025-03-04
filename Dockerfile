FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-20.04

USER root

COPY provision.sh .

ARG TZ="Australia/Perth"

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive \
     TZ="${TZ}" \
       apt-get install -y --no-install-recommends \
         apt-utils \
         ca-certificates \
         curl \
         git \
         locales \
         tzdata \
         wget \
         unzip \
         zip \
  && \
      echo "${TZ}" > /etc/timezone \
  && \
      ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime \
  && \
    DEBIAN_FRONTEND="noninteractive"  \
    TZ="${TZ}" \
      dpkg-reconfigure --frontend=noninteractive tzdata \
  && \
    DEBIAN_FRONTEND="noninteractive"  \
      yes | unminimize \
  && DEBIAN_FRONTEND="noninteractive"  \
     TZ="${TZ}" \
        ./provision.sh \
  && apt-get clean \
  && rm -rf /var/cache/apt/* \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && rm -rf /var/tmp/* \
  && rm provision.sh

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# set default shell
ENV SHELL=/bin/bash
USER $USERNAME

# ensure git is configured properly for Codespaces
RUN git config --global init.defaultBranch main

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8


