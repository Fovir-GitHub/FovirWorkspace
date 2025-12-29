{...}: {
  plugins.telescope = {
    enable = true;

    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };
    settings = {
      defaults.vimgrep_arguments = [
        "rg"
        "--color=never"
        "--no-heading"
        "--with-filename"
        "--line-number"
        "--column"
        "--smart-case"
        "--hidden"
        "--glob"
        "!**/.git/*"
      ];
      pickers = {
        buffers = {
          ignore_current_buffer = false;
          initial_mode = "normal";
          select_current = true;
          sort_mru = true;
        };
        find_files.find_command = [
          "rg"
          "--files"
          "--hidden"
          "--glob"
          "!**/.git/*"
        ];
      };
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
      "<leader>b" = {
        action = "buffers";
        mode = "n";
        options.desc = "[B]uffers";
      };
    };
  };
}
