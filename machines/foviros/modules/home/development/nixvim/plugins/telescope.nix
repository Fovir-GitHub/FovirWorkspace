{...}: {
  plugins.telescope = {
    enable = true;

    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };
    settings.pickers.buffers = {
      ignore_current_buffer = false;
      initial_mode = "normal";
      select_current = true;
      sort_mru = true;
    };
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        mode = "n";
        options.desc = "[F]ind [F]iles";
      };
      "<leader>st" = {
        action = "live_grep";
        mode = "n";
        options.desc = "[S]earch [T]ext";
      };
      "<leader><Tab>" = {
        action = "buffers";
        mode = "n";
        options.desc = "Select Buffer";
      };
    };
  };
}
