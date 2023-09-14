# MAINTAINER BwayCer (https://github.com/BwayCer/image.docker)


FROM archlinux:latest

ARG una=bwaycer
ARG uid=1000
# ARG dockerGid=973,974
ARG dockerGid=-1

# 中文語系包
COPY ./repo/share/i18n_locales/zh_CN /usr/share/i18n/locales/zh_CN
COPY ./repo/share/i18n_locales/zh_TW /usr/share/i18n/locales/zh_TW
COPY ./repo/share/locale/zh_TW/ /usr/share/locale/zh_TW/
RUN chown root:root -R \
        /usr/share/i18n/locales/zh_CN \
        /usr/share/i18n/locales/zh_TW \
        /usr/share/locale/zh_TW

# 鏡像站點： 臺灣
RUN sed -i '1i \
Server = https://free.nchc.org.tw/arch/$repo/os/$arch\n\
Server = https://archlinux.cs.nctu.edu.tw/$repo/os/$arch\n\
Server = https://archlinux.ccns.ncku.edu.tw/archlinux/$repo/os/$arch\n\
Server = https://shadow.ind.ntou.edu.tw/archlinux/$repo/os/$arch\n\
Server = https://ftp.yzu.edu.tw/Linux/archlinux/$repo/os/$arch\
' /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist

# 程式包更新
RUN pacman -Sy --noconfirm pacman && \
    pacman -Su --noconfirm
# 安裝常用程式包
RUN pacman -Sy --noconfirm docker && { \
        grep "docker:.*:${dockerGid}:" /etc/group &> /dev/null || \
        groupmod -g "$dockerGid" docker; \
    } || :
RUN pacman -S --noconfirm \
        base base-devel bash-completion neovim \
        sudo openssh git tmux wget tree docker-compose && \
    ln -s /usr/bin/nvim /usr/bin/vi
RUN pacman -S --noconfirm \
        rsync rclone unzip p7zip cifs-utils
    # openssh 為 git 與遠程端通訊的工具
    # cifs-utils 為 mount.cifs 共享遠程文件掛載工具

# visudo
#   # %wheel ALL=(ALL) NOPASSWD: ALL
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

## 臺北時間
RUN ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime

## 中文語系
RUN echo -e "en_US.UTF-8 UTF-8\nzh_TW.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen
ENV LANG=zh_TW.UTF-8 \
    LC_TIME=en_US.UTF-8
# ENV LC_ALL=zh_TW.UTF-8

# 用戶
RUN useradd -m -u "$uid" -G wheel,docker "$una"

