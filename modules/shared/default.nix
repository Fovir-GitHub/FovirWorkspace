{
  imports = [
    ./bootstrap.nix
    ./build-vm-settings.nix
    ./nix.nix
    ./overlays.nix
    ./ssh.nix
    ./zfs.nix
  ];
}
