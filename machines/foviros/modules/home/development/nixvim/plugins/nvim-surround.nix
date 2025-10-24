{...}: {
  # Add surrounding characters to selected contents.
  plugins.nvim-surround = {
    enable = true;

    settings = {
      keymaps = {
        visual = "S"; # Bind `S`.
      };
    };
  };
}
