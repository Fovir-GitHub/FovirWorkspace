{pkgs, ...}: let
  strawberry = "strawberry";
in {
  home.packages = [pkgs.${strawberry}];
  wayland.windowManager.hyprland.settings = {
    exec-once = [strawberry];
    windowrulev2 = ["workspace special, class:.*${strawberry}.*"];
  };
  xdg.configFile."strawberry/strawberry.conf".source = ./strawberry.conf;
}
