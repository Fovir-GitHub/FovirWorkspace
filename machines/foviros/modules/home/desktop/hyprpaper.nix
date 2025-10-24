{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    hyprpaper
  ];

  services.hyprpaper = {
    enable = true;

    settings = let
      default_wallpaper = "${config.xdg.userDirs.pictures}/Wallpaper/0.png";
    in {
      ipc = "on";
      preload = [
        default_wallpaper
      ];
      wallpaper = ",${default_wallpaper}";
    };
  };

  home.file."Pictures/Wallpaper" = {
    force = true;
    recursive = true;
    source = pkgs.fetchFromGitHub {
      hash = "sha256-YoFBK6e/CY9VkCJd+ACoMSGoUTo+8MguyEIcCEN1Edk=";
      owner = "FovirOS";
      repo = "wallpaper";
      rev = "28031d92a2da6f3b1c0f4409a47eca4cae2b2516";
    };
  };

  home.file.".local/bin/random_wallpaper.sh" = {
    executable = true;

    text = ''
      #!/usr/bin/env bash

      WALLPAPER_DIR="$HOME/Pictures/Wallpaper/"
      WALLPAPER="$WALLPAPER_DIR$(ls "$WALLPAPER_DIR" | shuf -n 1)"

      hyprctl hyprpaper reload ,"$WALLPAPER"
    '';
  };
}
