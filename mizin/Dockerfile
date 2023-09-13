# MAINTAINER BwayCer (https://github.com/BwayCer/image.docker)


FROM local/mizin:sshentry

RUN apk upgrade --no-cache

ENV PIPENV_VENV_IN_PROJECT=1
RUN apk add --no-cache python3 py3-pip && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip && \
    pip install --ignore-installed pipenv
    # 安裝 `pipenv` 問題
    #   https://stackoverflow.com/questions/53807511
    #   此文不建議使用 `--ignore-installed` 選項的方式，
    #   但由於後續程式包安裝皆會採用 `pipenv` 而妥協。

RUN apk add --no-cache go nodejs npm

# Vim Plug:preservim/tagbar 的依賴
RUN apk add --no-cache ctags

