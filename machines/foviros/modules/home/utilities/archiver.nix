{pkgs, ...}: {
  home.packages = with pkgs; [
    peazip

    gnutar
    zip
    unzip
    gzip
  ];
}
