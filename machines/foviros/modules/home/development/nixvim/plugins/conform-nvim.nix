{...}: {
  plugins.conform-nvim = {
    enable = true;

    settings = {
      format_on_save = ''
        function(bufnr)
          return {lsp_fallback = true}
        end
      '';

      formatters_by_ft = {
        "_" = ["prettier"];
        "c" = ["clang_format"];
        "cpp" = ["clang_format"];
        "go" = ["gofmt"];
        "nix" = ["alejandra"];
        "toml" = ["taplo"];
        "java" = ["google-java-format"];
      };
    };
  };
}
