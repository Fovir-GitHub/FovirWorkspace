{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (_final: prev: {
      sui = prev.callPackage ../../pkgs/sui {
        platform = prev.stdenv.hostPlatform;
      };
    })
    (final: prev: {
      vimPlugins =
        prev.vimPlugins
        // {
          hlchunk-nvim = prev.vimPlugins.hlchunk-nvim.overrideAttrs (oldAttrs: {
            src = pkgs.fetchFromGitHub {
              owner = "shellRaining";
              repo = "hlchunk.nvim";
              rev = "d5e45809ed93991ade8e10e4f706cd7699b17430";
              sha256 = "sha256-NcfH9AnURII+MTSoyDgnotpzjcLNxXx1BXnKYXP2C/0=";
            };
          });
        };
    })
    inputs.nix-vscode-extensions.overlays.default
  ];
}
