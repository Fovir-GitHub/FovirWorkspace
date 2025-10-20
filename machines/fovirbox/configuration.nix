{...}: {
  disko.devices.disk.main.device = "/dev/disk/by-path/pci-0000:00:07.0";
  networking.hostId = "00000000";

  imports = [
    ./modules
    ../../modules/optional/zfs.nix
    ../../modules/optional/podman.nix
    ../../modules/shared
  ];
}
