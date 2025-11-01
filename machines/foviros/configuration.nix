{inputs, ...}: {
  system.stateVersion = "25.05";

  imports = [
    ../../modules/optional/boot-loader/systemd-boot.nix
    ../../modules/optional/desktop-services
    ../../modules/optional/kernels/cachyos-desktop.nix
    ../../modules/optional/virtualisation/qemu.nix
    ../../modules/optional/virtualisation/podman.nix
    ../../modules/optional/zfs.nix
    ../../modules/shared
    ./modules
    ./values/hardware-configuration.nix
    inputs.chaotic.nixosModules.default
    inputs.daeuniverse.nixosModules.dae
    inputs.daeuniverse.nixosModules.daed
    inputs.home-manager.nixosModules.home-manager

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
