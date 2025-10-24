{pkgs, ...}: {
  home.packages = with pkgs; [
    zap
  ];
}
