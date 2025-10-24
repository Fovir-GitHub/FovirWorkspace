{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    qt6ct
  ];

  qt = {
    enable = true;
    style.name = "kvantum";
  };

  home.file."${config.xdg.configHome}/qt5ct/qt5ct.conf".source = ./qt5ct.conf;
  home.file."${config.xdg.configHome}/qt6ct/qt6ct.conf".source = ./qt6ct.conf;
  home.file."${config.xdg.configHome}/qt5ct/catppuccin-mocha-lavender.conf".source = ./catppuccin-mocha-lavender.conf;
  home.file."${config.xdg.configHome}/qt6ct/catppuccin-mocha-lavender.conf".source = ./catppuccin-mocha-lavender.conf;

  home.file."${config.xdg.configHome}/Kvantum/kvantum.kvconfig".source = ./kvantum.kvconfig;
  home.file."${config.xdg.configHome}/Kvantum/catppuccin-mocha-lavender/catppuccin-mocha-lavender.kvconfig".source = ./catppuccin-mocha-lavender/catppuccin-mocha-lavender.kvconfig;

  home.file."${config.xdg.configHome}/Kvantum/catppuccin-mocha-lavender/catppuccin-mocha-lavender.svg" = {
    source = ./catppuccin-mocha-lavender/catppuccin-mocha-lavender.svg;
  };
}
