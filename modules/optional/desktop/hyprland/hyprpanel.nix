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
    };
    packages = with pkgs; [
      cava
      libnotify
    ];
  };

  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod, D, exec, hyprpanel dnd"
      "$mod, R, exec, hyprpanel r"
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
