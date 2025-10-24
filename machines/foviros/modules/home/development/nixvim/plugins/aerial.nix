{...}: {
  plugins.aerial = {
    enable = true;

    settings = {
      open_automatic = false;
      filter_kind = false;
      show_guides = true;

      layout = {
        default_direction = "right";
      };
    };
  };
}
