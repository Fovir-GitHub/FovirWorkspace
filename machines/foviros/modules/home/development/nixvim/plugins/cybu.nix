{...}: {
  plugins.cybu = {
    enable = true;

    settings = {
      position = {
        relative_to = "win";
        anchor = "topcenter";
        vertical_offset = 0;
        horizontal_offset = 0;
        max_win_height = 10;
        max_win_width = 0.5;
      };
      style = {
        path = "tail_dir";
        path_abbreviation = "none";
        border = "rounded";
        separator = " ";
        prefix = "…";
        padding = 1;
        hide_buffer_id = true;
        devicons = {
          enabled = true;
          colored = true;
          truncate = true;
        };
        highlights = {
          current_buffer = "CybuFocus";
          adjacent_buffers = "CybuAdjacent";
          background = "CybuBackground";
          border = "CybuBorder";
        };
      };
      behavior = {
        mode = {
          default = {
            switch = "immediate";
            view = "rolling";
          };
          last_used = {
            switch = "immediate";
            view = "rolling";
            update_on = "buf_enter";
          };
          auto = {
            view = "rolling";
          };
        };
        show_on_autocmd = false;
      };
      display_time = 600;
      exclude = [
        "neo-tree"
        "fugitive"
        "qf"
      ];
      filter = {
        unlisted = true;
      };
    };
  };
}
