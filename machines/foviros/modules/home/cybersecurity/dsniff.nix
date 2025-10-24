{pkgs, ...}: {
  home.packages = with pkgs; [
    dsniff
  ];
}
