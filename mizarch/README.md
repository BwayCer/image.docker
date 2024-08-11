閩式拱門
=======

本微與拱門林納斯，打造主機的沙盒環境。

使用 [bwaycer/archlinux-tw](../archlinux-tw/) 為基底。


## 標籤

本映像需在本地主機上建立，故無提供標籤。


建立映像的命令如下：

```
docker compose build \
  --build-arg dockerGid=$(getent group docker | sed "s/.*:.*:\([0-9]*\):.*/\1/")
```


## 問與答

### 容器內調用 docker

在容器內調用 docker 會將命令傳遞給主機的 docker 來執行，需將主機的 `/var/run/docker.sock` 位置掛載到容器中。
因此容器的 docker 群組識別碼需要跟主機的相同。

在本映像中可以透過 `--build-arg dockerGid=<gid>` 來設定。

