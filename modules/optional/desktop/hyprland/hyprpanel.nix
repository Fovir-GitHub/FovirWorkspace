{avatar-path}: {
  inputs,
  config,
  pkgs,
  ...
}: {
  programs.hyprpanel = {
    enable = true;
    package = inputs.hyprpanel.packages.${pkgs.stdenv.hostPlatform.system}.default;

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
    bind = [
      "$mod, D, exec, hyprpanel dnd"
      "$mod, R, exec, restart-hyprpanel"
    ];
    exec-once = ["hyprpanel &"];
    layerrule = [
      "animation slide left, match:namespace .*dashboardmenu.*"
      "animation slide right, match:namespace .*notificationsmenu.*"
      "animation slide right, match:namespace .*calendarmenu.*"
      "animation fade, match:namespace .*verification.*"
    ];
  };
}
