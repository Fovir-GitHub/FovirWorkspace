{...}: {
  disko.devices.disk.main.device = "/dev/disk/by-path/pci-0000:00:07.0";
  networking.hostId = "00000000";

  services.openssh.ports = import ./values/ssh-port.nix;
  boot.kernelParams = ["zfs.zfs_arc_max=2147483648"];

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
