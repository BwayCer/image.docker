# MAINTAINER BwayCer (https://github.com/BwayCer/image.docker)

FROM local/mizarch:bwaycer

ARG una=bwaycer

# RUN pacman -Syu --noconfirm
RUN pacman -Sy

# 編譯工具的依賴
RUN pacman -S --noconfirm base-devel && \
    rm -rf /var/cache/pacman/pkg/*

# 第三方安裝包 (不能以 root 執行)
RUN su "$una" -c 'git clone --depth 1 https://aur.archlinux.org/yay.git /tmp/yay' && \
    cd /tmp/yay && \
    su "$una" -c "makepkg -sic --noconfirm" && \
    rm -rf /tmp/yay /var/cache/pacman/pkg/*
RUN su "$una" -c 'yay -S --noconfirm downgrade' && \
    su "$una" -c "rm -rf ~/.cache/yay" && \
    rm -rf /tmp/yay /var/cache/pacman/pkg/*

## 安裝開發環境基礎程式包
RUN pacman -S --noconfirm \
        adobe-source-han-serif-otc-fonts && \
    rm -rf /var/cache/pacman/pkg/*
    # adobe-source-han-serif-otc-fonts: 支援中文字, 桌面程式的依賴
RUN pacman -S --noconfirm \
         vim ctags p7zip && \
    downgrade --ignore never neovim=0.9.5-6 -- --noconfirm && \
    ln -sf /usr/bin/nvim /usr/bin/vi && \
    rm -rf /var/cache/pacman/pkg/*
    # neovim: v0.10 需要花時間調整設定文件
    # ctags: Vim Plug:preservim/tagbar 的依賴
RUN pacman -S --noconfirm \
        rsync rclone cifs-utils && \
    rm -rf /var/cache/pacman/pkg/*
    # cifs-utils: mount.cifs 共享遠程文件掛載工具

RUN pacman -S --noconfirm python python-pip && \
    pip install pipenv

RUN pacman -S --noconfirm \
    ffmpeg \
    go nodejs npm dart
