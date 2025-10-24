{ ... }:
{
  plugins.lsp.servers.ltex = {
    enable = true;

    filetypes = [
      "markdown"
      "bibtex"
      "latex"
    ];

    settings = {
      checkFrequency = "save";

      enabled = [
        "bibtex"
        "latex"
        "markdown"
      ];
    };
  };
}
