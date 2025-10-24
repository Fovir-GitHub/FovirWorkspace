{...}: {
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "horizon";
      vim_keys = true;
    };
  };
}
