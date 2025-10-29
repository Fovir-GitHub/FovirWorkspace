{...}: {
  plugins.neo-tree = {
    enable = true;

    settings = {
      enable_diagnostics = true;
      enable_git_status = true;
      enable_modified_markers = true;
      use_default_mappings = false;
      close_if_last_window = true;
      popup_border_style = "rounded";
      filesystem = {
        follow_current_file = {
          enabled = true;
          leave_dirs_open = true;
        };
        use_libuv_file_watcher = true;
      };
      clipboard = {
        sync = "universal";
      };
      window = {
        mapping_options = {
          noremap = true;
        };
        mappings = {
          "<cr>" = "open";
          "o" = "open";
          "<C-\\>" = "open_vsplit";
          "r" = "rename";
          "h" = "close_node";
          "f" = "refresh";
          "a" = {
            command = "add";
            config = {
              show_path = "relative";
            };
          };
          "A" = "add_directory";
          "y" = "copy_to_clipboard";
          "p" = "paste_from_clipboard";
          "d" = "delete";
          "." = "toggle_hidden";
        };
      };

      event_handlers.__raw = ''
        {
          {
            event = "file_open_requested",
            handler = function()
              require("neo-tree.command").execute({ action = "close" })
            end
          },
        }
      '';
    };
  };

  keymaps = [
    {
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      mode = "n";
      options.desc = "Toggle File Explorer";
    }
  ];
}
