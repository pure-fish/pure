# Specify fish version to use during build
# docker build -t <image> --build-arg FISH_VERSION=<version>
ARG FISH_VERSION
FROM purefish/docker-fish:${FISH_VERSION} AS only-fish

# Redeclare ARG so its value is available after FROM (cf. https://github.com/moby/moby/issues/34129#issuecomment-417609075)
ARG FISH_VERSION
RUN printf "\nBuilding \e[38;5;27mFish-%s\e[m\n\n" ${FISH_VERSION}

# Install dependencies
USER root
# hadolint ignore=DL3018
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
USER nemo

# create an image with pure's source code for testing (lightweight)
FROM only-fish AS with-pure-installed
USER root
RUN chmod -R 777 /home/nemo
USER nemo
WORKDIR /home/nemo/.config/fish/pure/
COPY --chown=nemo:nemo ./functions/ /home/nemo/.config/fish/pure/functions/
COPY --chown=nemo:nemo ./conf.d/ /home/nemo/.config/fish/pure/conf.d/
COPY --chown=nemo:nemo ./tests/ /home/nemo/.config/fish/pure/tests/
COPY --chown=nemo:nemo ./tools/ /home/nemo/.config/fish/pure/tools/
COPY --chown=nemo:nemo ./docs/ /home/nemo/.config/fish/pure/docs/

# create an image with chromium for screenshots (heavy)
FROM with-pure-installed AS with-chromium-installed
USER root
# hadolint ignore=DL3018
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
USER nemo

FROM with-chromium-installed AS with-puppeteer-installed
# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Install yarn and puppeteer
USER root
RUN npm install --global \
    yarn@1.22.22 \
    puppeteer@21.10.0
USER nemo

FROM with-puppeteer-installed AS with-terminal-screenshot-source

# hadolint ignore=DL3003
RUN git clone --depth 1 https://github.com/edouard-lopez/terminal-screenshot.git --branch feat/add-color-scheme-support \
    && cd terminal-screenshot \
    && yarn install \
    && yarn cache clean \
    && yarn build

# create an image with pure installed as prompt (for screenshots)
FROM with-terminal-screenshot-source AS with-terminal-screenshot-installed
# Install globally with yarn
USER root
RUN mkdir -p /usr/local/lib/terminal-screenshot \
    && cp -r terminal-screenshot/out /usr/local/lib/terminal-screenshot/ \
    && cp -r terminal-screenshot/node_modules /usr/local/lib/terminal-screenshot/ \
    && ln -s /usr/local/lib/terminal-screenshot/out/src/cli.js /usr/local/bin/terminal-screenshot \
    && chmod +x /usr/local/bin/terminal-screenshot
USER nemo

ENTRYPOINT ["fish", "-c"]
CMD ["fishtape tests/*.test.fish"]
