{...}: {
  programs.kitty = {
    enable = true;

    enableGitIntegration = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 14;
    };
    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
    };
    settings.clear_all_shortcuts = "yes";
    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
      mode = "no-rc";
    };
    themeFile = "Catppuccin-Mocha";
  };
}
