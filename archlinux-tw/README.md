ArchLinux for TW
=======

映像設定了臺灣的鏡像站點、時區、語系。


## 標籤

當標籤為 `base-20240804.0.251467` 時，意思是使用
[`archlinux:base-20240804.0.251467`](https://hub.docker.com/_/archlinux)
映像為基底，並保證在該版本下可工作。
其建立映像的命令如下：

```
docker compose build --build-arg version=base-20240804.0.251467
```


## 問題

### 中文化文件缺失

要切換中文語系需要取得：

  * `/usr/share/i18n/locales/zh_CN`
  * `/usr/share/i18n/locales/zh_TW`

兩份文件才能完成 `locale-gen` 的設定。

> 上述文件是 Archlinux 主機 `pacman -Syu` 升級後從系統中取得。


原本 `pacman` 下載時會自動會安裝的所有語言包的，但該功能在容器環境內被關閉了。

> 目前我們從映像中排除了一些文件以保持較小的大小：
> ```
> No Extract  = usr/share/locale/* usr/share/X11/locale/* usr/share/i18n/*
> NoExtract   = !*locale*/en*/* !usr/share/i18n/charmaps/UTF-8.gz !usr/share/*locale*/locale.*
> NoExtract   = !usr/share/*locales/en_?? !usr/share/*locales/i18n* !usr/share/*locales/iso*
> ```
> _概述, 翻譯 from: [[Question] Has ArchLinux on Docker discontinued support for non-Indo-European locales? //archlinux.org](https://gitlab.archlinux.org/archlinux/archlinux-docker/-/issues/59)_

因此需要修改 `/etc/pacman.conf` 來重新啟用。
為了維持容器的最小化，只針對中文部分重新啟用。

修改完後再安裝有語言包的命令 (ex: sudo) 就會在
`/usr/share/locale/zh_TW/LC_MESSAGES/` 目錄下看到對應文件。
