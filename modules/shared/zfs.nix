{
  inputs,
  lib,
  pkgs,
  ...
}:
with lib; {
  boot = {
    kernelParams = ["zfs_force=1"];
    zfs = {
      forceImportRoot = false;
      devNodes = "/dev/disk/by-path";
      package = inputs.nixpkgs-zen-6-17-9.legacyPackages.${pkgs.stdenv.hostPlatform.system}.zfs;
    };
  };
  services.zfs = {
    autoScrub = {
      enable = true;
      interval = "weekly";
    };
    trim = {
      enable = false;
      interval = "weekly";
    };
    autoSnapshot.enable = true;
  };
  systemd.services = {
    zfs-share.enable = mkForce false;
    zfs-zed.enable = mkForce false;
  };
  zramSwap.enable = true;
}
