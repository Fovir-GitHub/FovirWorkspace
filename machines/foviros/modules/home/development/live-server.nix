{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.nixpkgs-25-05.legacyPackages.${pkgs.stdenv.hostPlatform.system}.nodePackages.live-server
  ];
}
