# Install Operating system and dependencies
FROM ubuntu:20.04 AS builder
LABEL maintainer="rbalch@hugeinc.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND=dialog

# Install tzdata non-interactively
RUN apt update -y
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata

RUN apt install --no-install-recommends -y \
    curl \
    git \
    wget \
    unzip \
    libgconf-2-4 \
    gdb \
    libstdc++6 \
    libglu1-mesa \
    fonts-droid-fallback \
    python3 \
    clang \
    cmake \
    ninja-build \
    pkg-config \
    libgtk-3-dev

# RUN apt clean

# Install Chrome
RUN cd ~ && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --no-check-certificate && apt install -y ./google-chrome-stable_current_amd64.deb

# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
RUN flutter doctor

# Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web

# FROM builder as deploy
WORKDIR /code
COPY . .
WORKDIR /code/app
RUN flutter pub get

# Add fwr alias to .bashrc for the root user
RUN echo "alias fwr='flutter run -d web-server --web-hostname=0.0.0.0 --web-port=8085'" >> /root/.bashrc
