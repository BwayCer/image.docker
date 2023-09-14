# MAINTAINER BwayCer (https://github.com/BwayCer/image.docker)


FROM local/mizarch:sshentry

RUN pacman -Syu --noconfirm

RUN pacman -S --noconfirm python python-pip && \
    pip install pipenv

RUN pacman -S --noconfirm \
    ffmpeg \
    go nodejs npm dart
RUN pacman -S --noconfirm go dart nodejs npm

