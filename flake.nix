{
  inputs = {
    clan-core = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "https://git.clan.lol/clan/clan-core/archive/main.tar.gz";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
      url = "github:Fovir-GitHub/nixvim";
    };
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = {
    self,
    clan-core,
    nixpkgs,
    ...
  } @ inputs: let
    # Usage see: https://docs.clan.lol
    clan = clan-core.lib.clan {
      inherit self;
      imports = [
        ./clan.nix
      ];
      specialArgs = {inherit inputs;};
    };
  in {
    inherit (clan.config) nixosConfigurations nixosModules clanInternals;
    clan = clan.config;
    # Add the Clan cli tool to the dev shell.
    # Use "nix develop" to enter the dev shell.
    devShells =
      nixpkgs.lib.genAttrs
      [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ]
      (system: {
        default = clan-core.inputs.nixpkgs.legacyPackages.${system}.mkShell {
          packages = with clan-core.inputs.nixpkgs.legacyPackages.${system}; [
            clan-core.packages.${system}.clan-cli
            sops
            just
            alejandra
            deadnix
          ];
        };
      });
  };
}
