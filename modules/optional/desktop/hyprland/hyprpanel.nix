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
        source = ../../../values/hyprpanel-config.json;
      };
      "${config.xdg.configHome}/hyprpanel/profile.png".source = avatar-path;
      ".local/bin/restart-hyprpanel" = {
        executable = true;
        force = true;
        text = ''
          #!/usr/bin/env bash
          hyprpanel -q && hyprpanel &
        '';
      };
    };
    packages = with pkgs; [
      libnotify
      cava
    ];
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = ["hyprpanel &"];
    bind = ["$mod, R, exec, restart-hyprpanel"];
    layerrule = [
      "animation slide left, .*dashboardmenu.*"
      "animation slide right, .*notificationsmenu.*"
      "animation slide right, .*calendarmenu.*"
      "animation fade, .*verification.*"
    ];
  };
}
