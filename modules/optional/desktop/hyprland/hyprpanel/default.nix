{avatar-path}: {
  config,
  pkgs,
  ...
}: {
  programs.hyprpanel = {
    enable = true;

    systemd.enable = false;
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

  wayland.windowManager.hyprland.settings = {
    exec-once = ["hyprpanel &"];
    layerrule = [
      "animation slide left, .*dashboardmenu.*"
      "animation slide right, .*notificationsmenu.*"
      "animation slide right, .*calendarmenu.*"
      "animation fade, .*verification.*"
    ];
  };
}
