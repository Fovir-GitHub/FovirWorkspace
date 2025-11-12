{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.hyprsession.packages.${pkgs.system}.hyprsession
  ];
}
