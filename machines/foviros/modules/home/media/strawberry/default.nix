{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    strawberry
  ];

  home.file."${config.xdg.configHome}/strawberry/strawberry.conf" = {
    source = ./strawberry.conf;
  };
}
