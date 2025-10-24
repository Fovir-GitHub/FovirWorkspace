{
  config,
  pkgs,
  ...
}: {
  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
  };

  home.packages = with pkgs; [
    libnotify
    cava
  ];

  home.file."${config.xdg.configHome}/hyprpanel/config.json" = {
    force = true;
    source = ./config.json;
  };

  home.file."${config.xdg.configHome}/hyprpanel/profile.png" = {
    source = ../../../../values/profile.png;
  };
}
