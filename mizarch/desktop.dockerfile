# MAINTAINER BwayCer (https://github.com/BwayCer/image.docker)


FROM local/mizarch:latest

# COPY ./repo/ /tmp/buildRepo/

# 程式包更新
RUN pacman -Syu --noconfirm

RUN pacman -S --noconfirm \
        adobe-source-han-serif-otc-fonts \
        ffmpeg kid3

# RUN pacman -S --noconfirm \
#         fcitx5 fcitx5-configtool fcitx5-chewing

# RUN pacman -S --noconfirm \
#         qt5ct dolphin dolphin-plugins konsole \
#         hicolor-icon-theme \


# NOTE: install AUR:google-chrome
# RUN pacman -S --noconfirm \
#         chromium

# RUN rm -rf /tmp/buildRepo/

