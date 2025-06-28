FROM docker.io/nixos/nix:2.26.4

ARG FISH_VERSION
ENV NIX_CONFIG "experimental-features = nix-command flakes"

# To speedup the later `ENTRYPOINT`, we add the `fish` package to the store
RUN nix build github:nixos/nixpkgs\#fish

COPY ./ /tmp/.pure
WORKDIR /tmp/.pure

# Tests are run as part of the `fishPlugins.fish` build process
RUN nix build --print-build-logs --impure --expr "$(cat ./docker/fish-with-pure.nix)"

# We still provide a shell for more manual testing
ENTRYPOINT ["./result/bin/fish"]
