{pkgs, ...}: {
  home.packages = with pkgs; [
    playerctl
  ];
  wayland.windowManager.hyprland.settings.bind = [
    "CTRL_ALT,SPACE,exec,playerctl play-pause"
    "CTRL_ALT,N,exec,playerctl next"
    "CTRL_ALT,P,exec,playerctl previous"
  ];
}
