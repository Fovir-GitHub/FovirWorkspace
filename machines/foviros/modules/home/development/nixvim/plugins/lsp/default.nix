{...}: {
  imports = [
    ./clangd.nix
    ./cssls.nix
    ./eslint.nix
    ./gopls.nix
    ./html.nix
    ./jdtls.nix
    ./jsonls.nix
    ./just.nix
    ./lemminx.nix
    ./ltex.nix
    ./nil.nix
    ./pyright.nix
    ./sqls.nix
    ./tailwindcss.nix
    ./ts_ls.nix
    ./yamlls.nix
  ];

  plugins.lsp = {
    enable = true;
  };
}
