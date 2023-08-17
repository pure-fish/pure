# Specify fish version to use during build
# docker build -t <image> --build-arg FISH_VERSION=<version>
ARG FISH_VERSION
FROM purefish/docker-fish:${FISH_VERSION} AS fish-only

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

USER nemo
WORKDIR /home/nemo/.config/fish/

FROM fish-only AS with-pure
# Copy source code
COPY --chown=nemo:nemo ./conf.d/* /home/nemo/.config/fish/conf.d/
COPY --chown=nemo:nemo ./functions/* /home/nemo/.config/fish/functions/
COPY --chown=nemo:nemo ./tests/* /home/nemo/.config/fish/tests/

ENTRYPOINT ["fish", "-c"]
CMD ["fishtape tests/*.test.fish"]
