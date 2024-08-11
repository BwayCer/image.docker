# MAINTAINER BwayCer (https://github.com/BwayCer/image.docker)

FROM local/mizarch:bwaycer

# RUN pacman -Syu --noconfirm
RUN pacman -Sy

RUN pacman -S --noconfirm python python-pip && \
    pip install pipenv

RUN pacman -S --noconfirm \
    ffmpeg \
    go nodejs npm dart

# Vim Plug:preservim/tagbar 的依賴
RUN pacman -S --noconfirm ctags
