{pkgs, ...}: {
  home.packages = with pkgs; [
    rustfmt
    cargo
  ];
}
