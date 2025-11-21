{inputs, ...}: {
  system.stateVersion = "25.05";

  imports = let
    username = "fovir";
  in [
    ../../modules/optional/boot-loader/systemd-boot.nix
    ../../modules/optional/desktop-services
    ../../modules/optional/dns.nix
    ../../modules/optional/kernels/cachyos-desktop.nix
    ../../modules/optional/virtualisation/podman.nix
    ../../modules/optional/virtualisation/qemu.nix
    ../../modules/shared
    ./modules
    ./values/hardware-configuration.nix
    (import ../../modules/optional/desktop/hyprland {
      username = username;
      avatar-path = ./values/profile.png;
    })
    inputs.chaotic.nixosModules.default
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
