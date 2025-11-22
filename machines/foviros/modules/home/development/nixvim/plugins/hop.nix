{...}: {
  plugins.hop = {
    enable = true;

    settings.case_insensitive = true;
  };

  keymaps = [
    {
      key = "<leader>/";
      action = "<cmd>HopPattern<CR>";
      mode = "n";
      options.desc = "Hop to A Pattern";
    }
  ];
}
