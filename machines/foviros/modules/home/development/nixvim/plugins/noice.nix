{...}: {
  plugins.noice = {
    enable = true;

    settings = {
      lsp.enabled = true;

      presets = {
        command_palette = true;
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
