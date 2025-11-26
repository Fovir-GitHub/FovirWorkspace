{...}: {
  plugins.telescope = {
    enable = true;

    extensions = {
      ui-select.enable = true;

      fzf-native.enable = true;
    };

    settings.pickers.buffers = {
      ignore_current_buffer = false;
      initial_mode = "normal";
      select_current = true;
      sort_lastused = true;
    };

    keymaps = {
      "<leader>ff" = {
        mode = "n";
        action = "find_files";
        options.desc = "[F]ind [F]iles";
      };
      "<leader>st" = {
        mode = "n";
        action = "live_grep";
        options.desc = "[S]earch [T]ext";
      };
      "<leader><Tab>" = {
        mode = "n";
        action = "buffers";
        options.desc = "Select Buffer";
      };
    };
  };
}
