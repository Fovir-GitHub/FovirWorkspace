{...}: {
  # Configure theme.
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      transparent_background = false;
      term_colors = true;
      default_integrations = true;

      integrations = {
        cmp = true;
        neotree = true;
        telescope.enabled = true;
        dashboard = true;
      };

      background = {
        dark = "mocha";
      };
    };
  };

  # extraConfigLuaPost = ''
  #   local cp = require("catppuccin.palettes").get_palette("mocha")
  #
  #   vim.api.nvim_set_hl(0, "NormalFloat", { bg = cp.base })
  #   vim.api.nvim_set_hl(0, "FloatBorder", { bg = cp.base, fg = cp.surface1 })
  #   vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = cp.base })
  #   vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = cp.base })
  #   vim.api.nvim_set_hl(0, "Pmenu", { bg = cp.base })
  #   vim.api.nvim_set_hl(0, "PmenuSel", { bg = cp.surface1 })
  # '';
}
