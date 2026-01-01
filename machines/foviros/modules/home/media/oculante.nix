{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [inputs.nixpkgs-oculante.legacyPackages.${pkgs.stdenv.hostPlatform.system}.oculante];
}
