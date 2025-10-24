{...}: {
  plugins.lsp.servers.nil_ls = {
    enable = true;

    filetypes = [
      "nix"
    ];

    settings = {
      formatting.command = ["alejandra"];
    };
  };
}
