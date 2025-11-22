{...}: {
  programs.neovide = {
    enable = true;

    settings = {
      fork = true;
      srgb = true;
      font = {
        normal = ["JetBrainsMono Nerd Font Mono"];
        size = 14.0;
      };
    };
  };
  wayland.windowManager.hyprland.settings.bind = ["$mod,N,exec,neovide"];
}
