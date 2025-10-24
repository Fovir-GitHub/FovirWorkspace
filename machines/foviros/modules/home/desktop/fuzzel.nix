{...}: {
  programs.fuzzel = {
    enable = true;

    settings = {
      colors = {
        background = "1e1e2edd";
        text = "cdd6f4ff";
        prompt = "bac2deff";
        placeholder = "7f849cff";
        input = "cdd6f4ff";
        match = "b4befeff";
        selection = "585b70ff";
        selection-text = "cdd6f4ff";
        selection-match = "b4befeff";
        counter = "7f849cff";
        border = "b4befeff";
      };

      main = {
        font = "JetBrainsMono Nerd Font Mono:size=14";
        icon-theme = "BeautyLine";
        icons-enabled = true;
        delayed-filter-ms = 0;
        delayed-filter-limit = 0;
        lines = 15;
        sort-result = "yes";
        width = 60;
      };
    };
  };
}
