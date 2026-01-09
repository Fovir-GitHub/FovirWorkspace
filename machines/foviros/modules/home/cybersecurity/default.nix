{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ghidra
    inputs.nixpkgs-25-05.legacyPackages.${pkgs.stdenv.hostPlatform.system}.dsniff
    nmap
    sqlmap
    zap
  ];
}
