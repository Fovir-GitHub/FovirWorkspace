{
  config,
  inputs,
  pkgs,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit (config.networking) hostName;
      inherit inputs;
    };

    users.fovir = {
      home = {
        homeDirectory = "/home/fovir";
        stateVersion = "25.05";
        username = "fovir";
      };
      imports = [
        ../../../../modules/optional/mutable-files.nix
        ../home
        inputs.nixvim.homeModules.nixvim
      ];
    };
  };

  users.users = {
    fovir = {
      isNormalUser = true;
      extraGroups = import ../../values/user-fovir-extra-groups.nix;
      hashedPassword = import ../../values/user-fovir-password.nix;
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
      homeMode = "755";
    };

    root = import ../../values/user-root.nix;
  };
}
