{lib, ...}: let
  disk = "/dev/disk/by-path/virtio-pci-0000:00:04.0";
in {
  boot.kernelParams = ["zfs.zfs_arc_max=2147483648"];
  boot.loader.limine.biosDevice = lib.mkForce disk;
  disko.devices.disk.main.device = disk;
  networking.hostId = "00000000";
  services.openssh.ports = import ./values/ssh-port.nix;
  users.users.root = import ./values/user-root.nix;

  imports = [
    ../../modules/optional/boot-loader/limine.nix
    ../../modules/optional/kernels/cachyos-server.nix
    ../../modules/optional/virtualisation/podman.nix
    ../../modules/optional/zfs.nix
    ../../modules/shared
    ./modules
    ./services
  ];
}
