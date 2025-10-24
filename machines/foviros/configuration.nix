{
  pkgs,
  config,
  inputs,
  ...
}: {
  system.stateVersion = "25.05";

  imports = [
    ../../modules/shared
    ../../modules/optional/desktop-services
    ../../modules/optional/zfs.nix
    ../../modules/optional/virtualisation/qemu.nix
    ../../modules/optional/virtualisation/docker.nix
    ../../modules/optional/boot-loader/systemd-boot.nix
    ../../modules/optional/kernels/cachyos-desktop.nix
    ./values/hardware-configuration.nix
    ./modules

    inputs.home-manager.nixosModules.home-manager
    inputs.chaotic.nixosModules.default
    {
      nixpkgs.overlays = [
        inputs.nix-vscode-extensions.overlays.default
      ];
    }
  ];

  networking = import ./values/networking.nix;

  programs.zsh.enable = true;

  security = import ./values/security.nix;
}
