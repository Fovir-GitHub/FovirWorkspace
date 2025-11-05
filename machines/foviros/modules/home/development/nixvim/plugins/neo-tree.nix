{...}: let
  openFileWithForceFocus = ''
    function(state)
      local tree = state.tree
      local node = assert(tree:get_node())
      require("neo-tree.sources.filesystem.commands").open(state)
      require("neo-tree.ui.renderer").focus_node(state, node:get_id())
    end
  '';
in {
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
          enabled = false;
          leave_dirs_open = false;
        };
      };
      clipboard = {
        sync = "universal";
      };
      window = {
        mappings = {
          "<cr>".__raw = openFileWithForceFocus;
          "o".__raw = openFileWithForceFocus;
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
            event = "file_opened",
            handler = function(file_path)
              require("neo-tree").close_all()
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
