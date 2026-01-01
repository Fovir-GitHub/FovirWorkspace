{inputs, ...}: {
  system.stateVersion = "26.05";

  imports = let
    username = "fovir";
  in [
    (import ../../modules/optional/desktop/hyprland {
      username = username;
      avatar-path = ./values/profile.png;
    })
    (import ./modules {username = username;})
    ../../modules/optional/boot-loader/systemd-boot.nix
    ../../modules/optional/dns.nix
    ../../modules/optional/kernels/zen.nix
    ../../modules/optional/virtualisation/podman.nix
    ../../modules/optional/virtualisation/qemu.nix
    ../../modules/shared
    ./values/hardware-configuration.nix
    inputs.chaotic.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
  ];

  boot = {
    kernelModules = ["amdgpu"];
    kernelParams = ["amdgpu" "resume_offset=0"];
  };
  networking = import ./values/networking.nix;
  programs.zsh.enable = true;
  security = import ./values/security.nix;
}
