{pkgs, ...}: {
  # Syntax highlight.
  plugins.treesitter = {
    enable = true;

    folding = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;

    settings = {
      auto_install = true;
      indent.enable = true;
      highlight = {
        enable = true;
      };
    };
  };

  extraConfigLua = ''
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.o.foldenable = true
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
  '';
}
