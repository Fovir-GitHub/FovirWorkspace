{...}: {
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    enableGitIntegration = true;

    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 14;
    };

    themeFile = "Catppuccin-Mocha";

    settings = {
      clear_all_shortcuts = "yes";
    };

    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
    };
  };
}
