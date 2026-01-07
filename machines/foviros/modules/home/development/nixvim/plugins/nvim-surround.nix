{...}: {
  plugins.nvim-surround = {
    enable = true;

    settings = {
      keymaps.visual = "S";

      surrounds = {
        "(" = {
          add = ["(" ")"];
          delete = "^(. ?)().-( ?.)()$";
          find.__raw = ''
            function()
              return M.get_selection({ motion = "a(" })
            end
          '';
        };
        "[" = {
          add = ["[" "]"];
          delete = "^(. ?)().-( ?.)()$";
          find.__raw = ''
            function()
              return M.get_selection({ motion = "a[" })
            end
          '';
        };
        "{" = {
          add = ["{" "}"];
          delete = "^(. ?)().-( ?.)()$";
          find.__raw = ''
            function()
              return M.get_selection({ motion = "a{" })
            end
          '';
        };
        "<" = {
          add = ["<" ">"];
          delete = "^(. ?)().-( ?.)()$";
          find.__raw = ''
            function()
              return M.get_selection({ motion = "a<" })
            end
          '';
        };
      };
    };
  };
}
