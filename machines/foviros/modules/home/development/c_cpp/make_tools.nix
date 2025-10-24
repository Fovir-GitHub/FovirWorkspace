{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bear
    cmake
    gnumake
  ];
}
