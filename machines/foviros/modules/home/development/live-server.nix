{pkgs, ...}: {
  home.packages = with pkgs; [
    nodePackages.live-server
  ];
}
