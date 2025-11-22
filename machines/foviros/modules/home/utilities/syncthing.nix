{pkgs, ...}: {
  home.packages = with pkgs; [
    syncthing
  ];
  wayland.windowManager.hyprland.settings.exec-once = ["syncthing --no-browser"];
}
