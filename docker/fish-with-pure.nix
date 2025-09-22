with import <nixpkgs> {};

let
  checkScript = ''
    fishtape tests/*.test.fish
  '';

  localPure = (fishPlugins.pure.overrideAttrs (old: {
    src = builtins.fetchGit ./.;
    checkPlugins = [ fishPlugins.fishtape_3 ];
    buildInputs = (old.buildInputs or []) ++ [ curl ];

    # We override after the `buildFishPlugin` wrapper applied its logic,
    # so we need to manually run stuff around what we see in the original plugin attr value.
    checkPhase = ''
      export HOME=$(mktemp -d)  # fish wants a writable home
      export PATH=${curl}/bin:$PATH
      fish "${writeScript "pure-test" checkScript}"
    '';
  }));
in
# Leveraging https://nixos.org/manual/nixpkgs/stable/#sec-fish-wrapper,
# we build a `fish` containing our local `pure` plugin.
(wrapFish {
  pluginPkgs = [ localPure fishPlugins.fishtape_3 ];
  runtimeInputs = [ curl diffutils ];
})
