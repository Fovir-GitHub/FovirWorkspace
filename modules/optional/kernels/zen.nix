{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelPatches = [
      {
        name = "fix_mediatek_bluetooth";
        patch = (
          pkgs.fetchpatch {
            url = "https://lore.kernel.org/linux-mediatek/20260514-bluetooh-fix-mt7922-v1-1-499c878af1e5@zohomail.in/raw";
            hash = "sha256-JHUGOYK4Wk3VIIl3nM73YYe+odrTOf5tcLg7ZjGRYGs=";
          }
        );
      }
    ];
  };
}
