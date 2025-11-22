{
  username,
  avatar-path,
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  imports = [
    (import ../../fcitx5.nix {inherit username;})
    (import ../home-manager/gtk.nix {inherit username;})
    (import ../home-manager/qt {inherit username;})
    (import ../home-manager/xdg.nix {inherit username;})
    (import ../home-manager/fuzzel.nix {inherit username;})
    ../../fonts.nix
  ];

  home-manager.users.${username} = {pkgs, ...}: {
    imports = [
      (import ./hyprpanel {inherit avatar-path;})
      ./hyprland.nix
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
