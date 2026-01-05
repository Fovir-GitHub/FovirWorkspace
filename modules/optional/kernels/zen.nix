{
  inputs,
  lib,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = inputs.nixpkgs-zen-6-17-9.legacyPackages.${pkgs.stdenv.hostPlatform.system}.linuxPackages_zen;
    zfs.package = lib.mkForce inputs.nixpkgs-zen-6-17-9.legacyPackages.${pkgs.stdenv.hostPlatform.system}.zfs;
  };
}
