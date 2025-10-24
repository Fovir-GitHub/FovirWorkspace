{pkgs, ...}: {
  plugins.lsp.servers.clangd = {
    enable = true;
    package = pkgs.llvmPackages_20.clang-tools;

    cmd = [
      "clangd"
      "--clang-tidy"
    ];
  };
}
