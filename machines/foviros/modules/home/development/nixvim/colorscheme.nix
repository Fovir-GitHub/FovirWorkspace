{...}: {
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      transparent_background = false;
      term_colors = true;
      default_integrations = true;
      integrations = {
        cmp = true;
        neotree = true;
        telescope.enabled = true;
        dashboard = true;
      };
      background.dark = "mocha";
    };
  };
}
