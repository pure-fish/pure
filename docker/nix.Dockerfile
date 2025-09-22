FROM docker.io/nixos/nix:2.26.4

ARG FISH_VERSION
ENV NIX_CONFIG "experimental-features = nix-command flakes"

# To speedup the later `ENTRYPOINT`, we add the `fish` package to the store
RUN nix build github:nixos/nixpkgs\#fish

COPY ./ /tmp/.pure
WORKDIR /tmp/.pure

# Tests are run as part of the `fishPlugins.fish` build process
RUN nix build --print-build-logs --impure --expr "$(cat ./docker/fish-with-pure.nix)" && \
    cp -r result /nix-result

# We still provide a shell for more manual testing
# Use a script to handle both interactive shell and command execution
COPY <<'EOF' /entrypoint.sh
#!/bin/sh
# Make sure fish can find itself in PATH for fishtape
export PATH=/nix-result/bin:$PATH

# Clean up any mock files left from the Nix build process
# These were created by nixbld1 user and can't be overwritten by root
rm -f /tmp/*.mock_response /tmp/*.mock_calls /tmp/*.mock_status_code 2>/dev/null || true

if [ $# -eq 0 ]; then
    # No arguments, start interactive shell
    exec /nix-result/bin/fish
else
    # Arguments provided, execute as command
    exec /nix-result/bin/fish -c "$*"
fi
EOF
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
