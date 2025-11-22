{...}: {
  programs.fastfetch.enable = true;

  xdg.configFile = {
    "fastfetch/config.jsonc".source = ./fastfetch.jsonc;
    "fastfetch/logo.txt".source = ./logo.txt;
  };
}
