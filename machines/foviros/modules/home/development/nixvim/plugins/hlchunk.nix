{...}: {
  plugins.hlchunk = {
    enable = true;

    settings = {
      blank = {
        enable = true;

        chars = ["  "];
        style = [
          {bg = "#434437";}
          {bg = "#2f4440";}
          {bg = "#433054";}
          {bg = "#284251";}
        ];
      };
      chunk = {
        enable = true;

        delay = 0;
        duration = 0;
        style = "#00ffff";
        use_treesitter = true;
      };
      exclude_filetypes.dashboard = true;
      indent.enable = false;
    };
  };
}
