{...}: {
  plugins.indent-blankline = {
    enable = true;

    settings = {
      indent = {
        char = "▏";
        smart_indent_cap = true;

        highlight = [
          "RainbowDelimiterRed"
          "RainbowDelimiterYellow"
          "RainbowDelimiterBlue"
          "RainbowDelimiterOrange"
          "RainbowDelimiterGreen"
          "RainbowDelimiterViolet"
          "RainbowDelimiterCyan"
        ];
      };

      exclude = {
        filetypes = [
          "dashboard"
        ];
      };

      scope = {
        enabled = true;
        show_exact_scope = true;
      };
    };
  };
}
