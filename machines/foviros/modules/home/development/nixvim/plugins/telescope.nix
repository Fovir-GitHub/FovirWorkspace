{...}: {
  plugins.telescope = {
    enable = true;

    extensions = {
      ui-select = {
        enable = true;
      };

      fzf-native = {
        enable = true;
      };
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
    };
  };
}
