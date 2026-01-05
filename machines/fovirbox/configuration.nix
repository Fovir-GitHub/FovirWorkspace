{...}: {
  boot.kernelParams = ["zfs.zfs_arc_max=2147483648"];
  disko.devices.disk.main.device = "/dev/disk/by-path/pci-0000:00:07.0";
  networking.hostId = "00000000";
  services.openssh.ports = import ./values/ssh-port.nix;
  users.users.root = import ./values/user-root.nix;

  imports = [
    ../../modules/optional/boot-loader/limine.nix
    ../../modules/optional/kernels/xanmod.nix
    ../../modules/optional/virtualisation/podman.nix
    ../../modules/shared
    ./modules
    ./services
  ];
}
