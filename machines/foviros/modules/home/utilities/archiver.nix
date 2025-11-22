{pkgs, ...}: {
  home.packages = with pkgs; [
    gnutar
    gzip
    peazip
    unzip
    zip
  ];
}
