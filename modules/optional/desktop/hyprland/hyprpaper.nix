{
  config,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;

    settings = let
      default_wallpaper = "${config.xdg.userDirs.pictures}/Wallpaper/0.png";
    in {
      ipc = "on";
      preload = [default_wallpaper];
      wallpaper = ",${default_wallpaper}";
    };
  };

  home = {
    packages = [pkgs.hyprpaper];
    file."Pictures/Wallpaper" = {
      force = true;
      recursive = true;
      source = pkgs.fetchFromGitHub {
        hash = "sha256-YoFBK6e/CY9VkCJd+ACoMSGoUTo+8MguyEIcCEN1Edk=";
        owner = "Fovir-GitHub";
        repo = "wallpaper";
        rev = "28031d92a2da6f3b1c0f4409a47eca4cae2b2516";
      };
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = ["hyprpaper"];
}
