{username}: let
  sciName = import ../../values/sci-name.nix;
in {
  programs = import ../../values/sci.nix;

  home-manager.users.${username}.wayland.windowManager.hyprland.settings = {
    exec-once = [sciName];
    windowrule = [
      "workspace special, match:class .*${sciName}.*"
    ];
  };
}
