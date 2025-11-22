{pkgs, ...}: let
  thunderbird = "thunderbird";
in {
  home.packages = [pkgs.${thunderbird}];
  wayland.windowManager.hyprland.settings = {
    exec-once = [thunderbird];
    windowrulev2 = ["workspace special, class:.*${thunderbird}.*"];
  };
}
