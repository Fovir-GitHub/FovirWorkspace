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
      "${config.xdg.configHome}/hyprpanel/profile.png" = {
        source = avatar-path;
      };
    };
    packages = with pkgs; [
      libnotify
      cava
    ];
  };
}
