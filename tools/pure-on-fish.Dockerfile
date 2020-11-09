# Specify fish version to use during build
# docker build -t <image> --build-arg FISH_VERSION=<version>
ARG FISH_VERSION=3.1.2
FROM andreiborisov/fish:${FISH_VERSION}

# Redeclare ARG so its value is available after FROM (cf. https://github.com/moby/moby/issues/34129#issuecomment-417609075)
ARG FISH_VERSION
RUN printf "\nBuilding \e[38;5;27mFish-%s\e[m\n\n" ${FISH_VERSION}

# Install dependencies
USER root
RUN apk add \
    --no-cache \
    coreutils \
    curl \
    gawk \
    gzip \
    tar

# Copy source code
USER nemo
COPY --chown=nemo:nemo . /tmp/.pure/
WORKDIR /tmp/.pure/

ENTRYPOINT ["fish", "-c"]
CMD ["fishtape tests/*.test.fish"]
