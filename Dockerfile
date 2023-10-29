# This image will always use the latest stable version of zsh
FROM zshusers/zsh:latest

# image metadata
LABEL org.opencontainers.image.title="docker-deb-ohmyzsh"
LABEL org.opencontainers.image.description="Oh My Zsh + NVM + Node 18.17.0"
LABEL org.opencontainers.image.url="https://github.com/treckstar/docker-deb-ohmyzsh"
LABEL org.opencontainers.image.vendor="Oh My Zsh"
LABEL org.opencontainers.image.authors="Brandon Trecki - @treckstar"
LABEL maintainer="Marc Cornellà <hello@mcornella.com>"

# set UTF-8 locale
ENV LANG=C.UTF-8

# install basic tools
RUN install_packages \
    ca-certificates \
    git \
    curl \
    bash

# specify the Oh My Zsh version string
ARG OMZ_VERSION=master

# install ohmyzsh
RUN BRANCH=${OMZ_VERSION} \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/${OMZ_VERSION}/tools/install.sh)" "" \
    --unattended

# RUN "omz plugin enable nvm nvim"

RUN sh -c "$(curl -fsSL  https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh )" "" \
    --unattended


RUN echo "'source ~/.nvm/nvm.sh' > ~/.zshrc"

RUN . ~/.nvm/nvm.sh
#    nvm install 18.17.0 && \
#    nvm use 18.17.0

