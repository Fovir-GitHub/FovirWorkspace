{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprshell.homeModules.hyprshell
  ];

  programs.hyprshell = {
    enable = true;
    package = inputs.hyprshell.packages.${pkgs.stdenv.hostPlatform.system}.hyprshell-nixpkgs;
    systemd.args = "-v";
    settings = {
      windows = {
        enable = true;

        items_per_row = 5;
        overview = {
          enable = true;
          filter_by = ["current_workspace"];
          hide_filtered = false;
          key = "super_l";
          launcher = {
            launch_modifier = "alt";
            max_items = 6;
            plugins = {
              actions = {enable = false;};
              applications = {
                enable = true;
                show_actions_submenu = false;
                show_execs = false;
              };
              terminal = {enable = false;};
              websearch = {enable = false;};
              calc = {enable = false;};
            };
            show_when_empty = false;
            width = 650;
          };
          modifier = "super";
        };
        scale = 8.5;
        switch = {
          enable = true;
          filter_by = [
            "current_monitor"
          ];
          modifier = "super";
          switch_workspaces = false;
        };
      };
    };
  };
}
