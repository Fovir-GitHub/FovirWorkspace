{
  pkgs,
  lib,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_stable;
    zfs.package = lib.mkForce pkgs.zfs_unstable;
  };
}
