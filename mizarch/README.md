閩式拱門
=======


> **版　本：** v3.0.0

> **基底映像：** [archlinux/base:latest](https://hub.docker.com/r/archlinux/base)

> **建立映像：** local/mizarch:latest



## 簡介


本微與拱門林納斯，
打造可攜帶並隔離主環境的開發測試環境。



## 問題


### 官方映像問題


官方映像 [archlinux:latest](https://hub.docker.com/_/archlinux/)
比目前使用的 [archlinux/base:latest](https://hub.docker.com/r/archlinux/base/)
的容器大小少了約 90 MB，
在輕量化上更具優勢，
但卻把語系文件刪除了，
由於目前不知道如何安裝語系文件及不清楚具體的使用差異，
故目前暫不使用。

```
# 2020.01.17 資料
REPOSITORY          SIZE
archlinux           409MB
archlinux/base      498MB
```

