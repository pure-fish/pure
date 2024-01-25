# Specify fish version to use during build
# docker build -t <image> --build-arg FISH_VERSION=<version>
ARG FISH_VERSION
FROM purefish/docker-fish:${FISH_VERSION} AS only-fish

# Redeclare ARG so its value is available after FROM (cf. https://github.com/moby/moby/issues/34129#issuecomment-417609075)
ARG FISH_VERSION
RUN printf "\nBuilding \e[38;5;27mFish-%s\e[m\n\n" ${FISH_VERSION}

# Install dependencies
USER root
RUN apk add \
    --no-cache \
    coreutils \
    gawk \
    gzip \
    tar \
    sudo \
    shadow \
    vim

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# hadolint ignore=DL3004
RUN echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel \
    && usermod -g wheel nemo \
    && echo "nemo:123" | sudo chpasswd

# create an image with pure's source code
FROM only-fish AS with-pure-source
USER nemo
WORKDIR /home/nemo/.config/fish/pure/
COPY --chown=nemo:nemo ./    /home/nemo/.config/fish/pure/

# create an image with pure installed as prompt
FROM with-pure-source AS with-pure-installed
RUN echo 'Symlink dev files' \
    && ln -nfs "$(pwd)"/completions/*.fish ../completions/ \
    && ln -nfs "$(pwd)"/conf.d/*.fish ../conf.d/ \
    && ln -nfs "$(pwd)"/functions/*.fish ../functions/

FROM with-pure-installed as with-terminal-screenshot-installed
USER root
RUN apk add \
    --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    npm \
    font-noto \
    font-noto-symbols \
    font-noto-emoji


# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

RUN npm install \
    --global \
    terminal-screenshot \
    puppeteer
USER nemo

ENTRYPOINT ["fish", "-c"]
CMD ["fishtape tests/*.test.fish"]
