{config, ...}: {
  programs.fastfetch = {
    enable = true;
  };

  home.file."${config.xdg.configHome}/fastfetch/config.jsonc".source = ./fastfetch.jsonc;

  home.file."${config.xdg.configHome}/fastfetch/logo.txt" = {
    source = ../../../../logo.txt;
  };
}
