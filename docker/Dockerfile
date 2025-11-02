# Specify fish version to use during build
# docker build -t <image> --build-arg FISH_VERSION=<version>
ARG FISH_VERSION
ARG SCREENSHOT_IMAGE=purefish/terminal-screenshot:fish-${FISH_VERSION}

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
WORKDIR /home/nemo/.config/fish/pure/
COPY --chown=nemo:nemo ./ /home/nemo/.config/fish/pure/
USER nemo

# Use prebuilt purefish/terminal-screenshot image to provide screenshot capabilities
# Override version using: --build-arg SCREENSHOT_IMAGE=purefish/terminal-screenshot:fish-4.0.2
# hadolint ignore=DL3006
FROM ${SCREENSHOT_IMAGE} AS with-terminal-screenshot-installed
USER nemo
WORKDIR /home/nemo/.config/fish/pure/
COPY --from=with-pure-installed /home/nemo/.config/fish/pure/ /home/nemo/.config/fish/pure/
RUN git config --global --add safe.directory /home/nemo/.config/fish/pure

ENTRYPOINT ["fish", "-c"]
CMD ["fishtape tests/*.test.fish"]
