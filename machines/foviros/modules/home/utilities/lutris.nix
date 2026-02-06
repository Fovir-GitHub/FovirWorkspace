{pkgs, ...}: {
  programs.lutris = {
    enable = true;

    defaultWinePackage = pkgs.proton-ge-bin;
    protonPackages = with pkgs; [proton-ge-bin];
    winePackages = with pkgs; [wineWow64Packages.full];
  };
}
