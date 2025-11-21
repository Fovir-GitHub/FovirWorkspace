{username}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  home-manager.users.${username} = {pkgs, ...}: {
    imports = [
      ./hyprland.nix
      ./hyprlock.nix
      ./hyprpaper.nix
      ./hyprpanel
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
