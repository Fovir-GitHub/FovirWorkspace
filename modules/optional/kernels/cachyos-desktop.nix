{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    zfs.package = pkgs.zfs_cachyos;
  };
}
