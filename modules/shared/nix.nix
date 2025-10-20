{lib, ...}:
with lib; {
  nix = {
    settings = {
      substituters = [
        "https://cache.nixos.org" # See https://nixos.wiki/wiki/Binary_Cache
        "https://chaotic-nyx.cachix.org" # See https://github.com/chaotic-cx/nyx
        "https://nix-community.cachix.org" # See https://nix-community.org/cache/
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
}
