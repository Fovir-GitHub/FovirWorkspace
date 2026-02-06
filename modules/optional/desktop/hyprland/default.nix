{
  username,
  avatar-path,
  monitor-config ? [],
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  imports = [
    (import ../../fcitx5.nix {inherit username;})
    (import ../home-manager/fuzzel.nix {inherit username;})
    (import ../home-manager/gtk.nix {inherit username;})
    (import ../home-manager/hardwares.nix {inherit username;})
    (import ../home-manager/qt {inherit username;})
    (import ../home-manager/xdg.nix {inherit username;})
    ../../fonts.nix
    ../services
  ];

  home-manager.users.${username} = {pkgs, ...}: {
    imports = [
      (import ./hyprland.nix {inherit monitor-config;})
      (import ./hyprpanel.nix {inherit avatar-path;})
      ./hyprlock.nix
      ./hyprpaper.nix
      ./hyprshell
    ];

    home = {
      pointerCursor = {
        hyprcursor = {
          enable = true;
          size = 24;
        };
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
        gtk.enable = true;
        x11 = {
          enable = true;
          defaultCursor = "Bibata-Modern-Ice";
        };
      };
    };
    services.hyprpolkitagent.enable = true;
  };
}
