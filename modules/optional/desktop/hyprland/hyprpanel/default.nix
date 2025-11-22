{avatar-path}: {
  config,
  pkgs,
  ...
}: {
  programs.hyprpanel = {
    enable = true;

    systemd.enable = true;
  };

  home = {
    file = {
      "${config.xdg.configHome}/hyprpanel/config.json" = {
        force = true;
        source = ./config.json;
      };
      "${config.xdg.configHome}/hyprpanel/profile.png".source = avatar-path;
    };
    packages = with pkgs; [
      libnotify
      cava
    ];
  };

  wayland.windowManager.hyprland.settings.layerrule = [
    "animation slide left, .*dashboardmenu.*"
    "animation slide right, .*notificationsmenu.*"
    "animation slide right, .*calendarmenu.*"
    "animation fade, .*verification.*"
  ];
}
