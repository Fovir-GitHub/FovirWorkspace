{
  inputs,
  pkgs,
  ...
}: {
  # boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelPackages = inputs.nixpkgs-zen-6-17-9.legacyPackages.${pkgs.stdenv.hostPlatform.system}.linuxPackages_zen;
}
