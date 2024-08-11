船塢工人文件
=======

> 養護工： 張本微 <bwaycer@gmail.com> (https://bwaycer.github.io)

那**建築**的**相片**， 我**跑**在裡面。


**頁籤**<br>
　- [容器文件](#容器文件) -<br />
　- [專案目錄結構](#專案目錄結構) - [推薦相關文章](#推薦相關文章) -


## 容器文件

* [bwaycer/archlinux-tw](./archlinux-tw/)
* [local/mizarch](./mizarch/)


## 專案目錄結構

  ```
  ─┬ vmfile/ (相當於本專案)
   └─┬ <vmItem ...>/  ---------------- 虛擬環境項目
     ├── [.dockerignore]
     ├── docker-compose.yml
     └─┬ <tag ...>/  ----------------- -- 映像標籤
       ├── [repo]/  ------------------ -- -- 資源目錄
       ├── [other.dockerfile ...]  --- -- -- 其他的船塢工人文件
       └── Dockerfile  --------------- -- -- 主要的船塢工人文件
  ```


## 推薦相關文章

* [如何写Dockerfile，Dockerfile 参考文档 by Deepzz 2016.12.15 //deepzz.com](https://deepzz.com/post/dockerfile-reference.html)
* [Build context # .dockerignore files //docker.com](https://docs.docker.com/build/building/context/#dockerignore-files)
