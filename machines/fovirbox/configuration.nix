{...}: {
  disko.devices.disk.main.device = "/dev/disk/by-path/pci-0000:00:07.0";
  networking.hostId = "00000000";

  services.openssh.ports = import ./values/ssh-port.nix;

  imports = [
    ./modules
    ./services
    ../../modules/optional/zfs.nix
    ../../modules/optional/podman.nix
    ../../modules/optional/kernels/cachyos-server.nix
    ../../modules/shared
  ];

  zramSwap.enable = true;
}
