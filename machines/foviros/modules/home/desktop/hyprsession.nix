{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.hyprsession.packages.${pkgs.stdenv.hostPlatform.system}.hyprsession
  ];
}
