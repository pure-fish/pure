build-users-group = nixbld
sandbox = false
experimental-features = nix-command flakes

environment.systemPackages = with pkgs; [
  fishPlugins.fishtape_3
];

programs.fish.enable = true;
