{...}: {
  plugins.luasnip = {
    enable = true;

    settings = {
      enable_autosnippets = true;
    };
  };

  plugins.cmp_luasnip = {
    enable = true;
  };
}
