{pkgs, ...}: {
  home.packages = with pkgs; [
    gnutar
    gzip
    p7zip
    peazip
    unzip
    zip
  ];
}
