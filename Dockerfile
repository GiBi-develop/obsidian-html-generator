FROM python:3.11-slim

RUN apt-get update && apt-get install -y wget tar xz-utils && \
    pip install --no-cache-dir \
    mkdocs \
    mkdocs-material \
    mkdocs-awesome-pages-plugin

ENV OBSIDIAN_EXPORT_VERSION="v25.3.0"
ENV OE_FILENAME="obsidian-export-x86_64-unknown-linux-gnu.tar.xz"

RUN wget https://github.com/zoni/obsidian-export/releases/download/${OBSIDIAN_EXPORT_VERSION}/${OE_FILENAME} && \
    tar -xf ${OE_FILENAME} && \
    cp $(find . -type f -name obsidian-export) /usr/local/bin/obsidian-export && \
    chmod +x /usr/local/bin/obsidian-export && \
    rm -rf ${OE_FILENAME} obsidian-export-*/

WORKDIR /docs

COPY mkdocs.yml ./

ENTRYPOINT ["sh", "-c", "\
    mkdir -p /output /site && \
    obsidian-export \"$1\" /output && \
    mkdocs build && \
    echo '✔ HTML сайт сгенерирован в /site' && \
    ls -lah /site \
"]
