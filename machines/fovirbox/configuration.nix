{inputs, ...}: {
  disko.devices.disk.main.device = "/dev/disk/by-path/pci-0000:00:07.0";
  networking.hostId = "00000000";

  imports = [
    inputs.chaotic.nixosModules.default
    ./modules
    ../../modules/optional/zfs.nix
    ../../modules/optional/podman.nix
  ];
}
