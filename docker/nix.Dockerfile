FROM nixos/nix:2.17.0

RUN nix --version
# RUN nix-channel --update

# hadolint ignore=DL3059
RUN nix-channel --update \
    && nix-env -iA nixpkgs.fish

SHELL [ "/root/.nix-profile/bin/fish", "-c" ]

# hadolint ignore=SC1008
RUN fish --version
# hadolint ignore=DL3059,SC1008
RUN nix-build '<nixpkgs>' -A fishPlugins.pure \
    && nix-env -iA \
    nixpkgs.vim \
    nixpkgs.diffutils \
    nixpkgs.curlMinimal \
    nixpkgs.gnused \
    nixpkgs.gawk \
    nixpkgs.fishPlugins.fishtape_3
# hadolint ignore=SC1008
COPY ./docker/configuration.nix /etc/nixos/configuration.nix
# hadolint ignore=SC1008
RUN mkdir -p /root/.config/fish/functions/ \
    && cp \
    /nix/store/*-user-environment/share/fish/vendor_functions.d/fishtape.fish \
    /root/.config/fish/functions/
# hadolint ignore=SC1008
RUN nix build \
    github:NixOS/nixpkgs/6573f71#fishPlugins.pure \
    --print-build-logs \
    || true

WORKDIR /tmp/.pure
ENTRYPOINT ["fish", "-c"]
# CMD [ "fishtape","./tests/*.test.fish" ]
