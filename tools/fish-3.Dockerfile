FROM alpine:3.8

ARG  FISH_VERSION=3.0.0

RUN echo "Building Fish-${FISH_VERSION}"; \
    apk add \
        --no-cache \
        curl \
    && curl \
        --location \
        --silent \
    https://github.com/fish-shell/fish-shell/releases/download/${FISH_VERSION}/fish-${FISH_VERSION}.tar.gz \
    | tar -xzf - 
RUN apk add \
        --no-cache \
        bc \
        g++ \
        git \
        groff \
        libgcc \
        libstdc++ \
        make \
        mdocml-apropos \
        ncurses \
        ncurses-dev \
        python \
        sudo \
        util-linux
RUN cd fish-${FISH_VERSION} \
    && ./configure \
    && make \
    && make install
RUN cd / \
    && rm \
        -f \
        -r \
        fish-${FISH_VERSION} \
    && apk del \
            --no-cache \
            g++ \
            make \
            ncurses-dev
RUN fish -c true \
    && adduser \
        -D \
        -u 1000 \
        -s /usr/local/bin/fish \
        nemo \
    && echo 'nemo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER nemo
WORKDIR /home/nemo

USER root
RUN apk add --no-cache \
    coreutils \
    curl 

COPY . /pure/

USER nemo
WORKDIR /pure/

RUN fish -c 'source /pure/tools/installer.fish && install_pure'
CMD ["fish"]