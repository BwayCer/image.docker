# MAINTAINER BwayCer (https://github.com/BwayCer/image.docker)

ARG version=latest

FROM archlinux:$version

ARG mirrorSite=TW
ARG timezone=Asia/Taipei

# 鏡像站點： 臺灣
RUN mirrorSiteTW='\
Server = https://free.nchc.org.tw/arch/$repo/os/$arch\n\
Server = https://archlinux.cs.nctu.edu.tw/$repo/os/$arch\n\
Server = https://archlinux.ccns.ncku.edu.tw/archlinux/$repo/os/$arch\n\
Server = https://shadow.ind.ntou.edu.tw/archlinux/$repo/os/$arch\n\
Server = https://ftp.yzu.edu.tw/Linux/archlinux/$repo/os/$arch\
' && \
    [ "$mirrorSite" == "TW" ] && { \
        theMirrorSite="$mirrorSiteTW"; \
    } || { \
        theMirrorSite="$(\
            curl https://archlinux.org/mirrorlist/?country=$mirrorSite | \
                grep -v 'http:' | sed "s/#Serv/Serv/" \
        )"; \
    } && \
    echo "$theMirrorSite" && \
    printf "%s\n\n\n## origin ---\n\n%s\n" \
       "$theMirrorSite" "$(cat /etc/pacman.d/mirrorlist)" > /etc/pacman.d/mirrorlist

# 臺北時間
RUN ln -sf /usr/share/zoneinfo/"$timezone" /etc/localtime

## 中文語系
COPY ./repo/usr__share__i18n__locales/zh_CN /usr/share/i18n/locales/zh_CN
COPY ./repo/usr__share__i18n__locales/zh_TW /usr/share/i18n/locales/zh_TW
RUN chown root:root -R \
        /usr/share/i18n/locales/zh_CN \
        /usr/share/i18n/locales/zh_TW
RUN echo -e "en_US.UTF-8 UTF-8\nzh_TW.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen
ENV LANG=zh_TW.UTF-8 \
    LC_TIME=en_US.UTF-8
# 使 pacman 在安裝時去下載 zh_TW 語言包
RUN lastConfLine="` \
        grep -n -e 'NoExtract.*usr/share/\*\?locales\?\*\?/\(locale\|i18n\)' -e 'NoExtract.*usr/share/i18n/\*' /etc/pacman.conf | \
        tail -n 1 | sed 's/\([0-9]\+\):.*/\1/' \
    `" && \
    sed -i $lastConfLine'iNoExtract   = !*locale*/zh*/* !usr/share/*locales/zh_??' /etc/pacman.conf && \
    tail -n 13 /etc/pacman.conf
