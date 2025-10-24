{...}: {
  plugins.dashboard = {
    enable = true;

    settings = {
      change_to_vcs_root = true;
      shortcut_type = "number";
      theme = "hyper";

      hide = {
        statusline = false;
      };

      config = {
        packages.enable = false;

        mru = {
          enable = false;
        };

        shortcut = [
          {
            action.__raw = ''
              function(path)
                require("persistence").select()
              end
            '';
            desc = "Select Session ";
            icon = "󰮳 ";
            key = "r";
          }

          {
            action.__raw = ''
              function(path)
                vim.cmd("ene")
              end
            '';
            desc = "New File ";
            icon = " ";
            key = "n";
          }

          {
            action.__raw = ''
              function(path)
                vim.cmd("qa")
              end
            '';
            desc = "Quit ";
            icon = "󰿅 ";
            key = "q";
          }
        ];

        header = [
          ""
          "                ╓▄████▄┌                 "
          "            ┌▄████▀╙▀▀███▌▄              "
          "        ┌▄████▀╝       └▀████▌▄          "
          "     ▄▓███▀▀               └▀████▄╓      "
          "    ╘████▌▄                 ┌▄████▀      "
          "   ╓   ╙▀████▄╓          ▄▄███▀▀    ╓    "
          "   ████▄┌   ╙▀████▄┌  ▄▄████▀└   ▄▄████  "
          "   ███▀████▄    ╙▀██████▀╙   ╓▄████▀╙    "
          "   ██▌  └▀████▌▄    ▀╙   ┌▄▓███▀╙        "
          "   ██▌      └▀████▄   ▄████▀▀            "
          "   ███▄         ╙▀▀   ███└        ┌▄██▌  "
          "   ██████▄▄           ███      ▄▓██████  "
          "   ██▀ ╙▀████▄╓       ███  ▄▓████▀  ███  "
          "   ██▌     ╙▀╙        ███████▀└     ███  "
          "   ██▌                ███▀╙         ███  "
          "   ██▀                          ▄▄████▀  "
          "   ██▌                      ╓▄████▀╙     "
          "                       ┬▄████▀╙          "
          "                     ▓███▀╙              "
          "                      ╙                  "
          ""
        ];

        project = {
          enable = true;
          action.__raw = ''
            function(path)
              vim.cmd("cd " .. path)
              vim.notify(path)
            end
          '';
          limit = 4;
        };

        footer = [
          " Coding or Dying "
        ];
      };
    };
  };
}
