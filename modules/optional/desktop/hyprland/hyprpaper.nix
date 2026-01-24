{
  config,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;
      wallpaper = [
        {
          monitor = "";
          path = "${config.xdg.userDirs.pictures}/Wallpaper";
          timeout = 60 * 15;
        }
      ];
    };
  };

  home = {
    packages = [pkgs.hyprpaper];
    file."Pictures/Wallpaper" = {
      force = true;
      recursive = true;
      source = pkgs.fetchFromGitHub {
        hash = "sha256-O4XXtgwhw7HRbJ3TmkpLC0ydp0HznEBD4lWvWzXTC7w=";
        owner = "Fovir-GitHub";
        repo = "wallpaper";
        rev = "0390bc8ff6f17177c9ef68d34eb2b2698d74cca9";
      };
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = ["hyprpaper"];
}
