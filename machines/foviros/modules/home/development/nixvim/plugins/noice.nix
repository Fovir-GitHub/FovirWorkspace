{...}: {
  plugins.noice = {
    enable = true;

    settings = {
      lsp.enabled = true;

      presets = {
        command_palette = true;
      };

      views = {
        cmdline_popup = {
          size = {
            width = "50%";
            height = "auto";
          };
        };
      };
    };
  };

  plugins.notify = {
    enable = true;

    settings = {
      timeout = 1;
    };
  };
}
