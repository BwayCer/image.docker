# MAINTAINER BwayCer (https://github.com/BwayCer/image.docker)

ARG version=latest

FROM bwaycer/archlinux-tw:$version

ARG una=bwaycer
ARG uid=1000
# 容器的 docker 的群組識別碼. (-1 為不更改)
ARG dockerGid=-1

# 容器必要更新
RUN pacman-key --init && \
    pacman -Sy

## 安裝基礎程式包
# 先安裝 docker 避免其他命令佔據 dockerGid 位置
RUN pacman -S --noconfirm docker docker-compose && { \
        [ "$dockerGid" -gt 0 ] && ( \
            grep "docker:.*:${dockerGid}:" /etc/group &> /dev/null || \
            groupmod -g "$dockerGid" docker \
        ) || : ; \
    } && \
    rm -rf /var/cache/pacman/pkg/*
RUN pacman -S --noconfirm \
        bash-completion vim \
        sudo openssh git tmux which wget less tree unzip && \
    ln -s /usr/bin/vim /usr/bin/vi && \
    rm -rf /var/cache/pacman/pkg/*
    # openssh: git 與遠程端通訊的工具

# visudo
#   # %wheel ALL=(ALL) NOPASSWD: ALL
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# 用戶
RUN useradd -m -u "$uid" -G wheel,docker "$una"
