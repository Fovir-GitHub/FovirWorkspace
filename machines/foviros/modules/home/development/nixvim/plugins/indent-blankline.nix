{...}: {
  highlight = {
    IndentYellow = {bg = "#434437";};
    IndentGreen = {bg = "#2f4440";};
    IndentRed = {bg = "#433054";};
    IndentBlue = {bg = "#284251";};
  };

  plugins.indent-blankline = {
    enable = true;

    settings = let
      highlight = [
        "IndentYellow"
        "IndentGreen"
        "IndentRed"
        "IndentBlue"
      ];
    in {
      indent = {
        char = "";
        smart_indent_cap = true;
        highlight = highlight;
      };
      whitespace = {
        highlight = highlight;
        remove_blankline_trail = false;
      };
      exclude.filetypes = ["dashboard"];
      scope = {
        enabled = true;
        show_exact_scope = true;
      };
    };
  };
}
