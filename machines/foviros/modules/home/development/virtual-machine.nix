{pkgs, ...}: {
  home.packages = with pkgs; [
    qemu

    quickemu
    virt-manager
  ];

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
