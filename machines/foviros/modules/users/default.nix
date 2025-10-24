{
  config,
  inputs,
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
      imports = [
        ./fovir.nix
        ../../../../modules/optional/mutable-files.nix
        inputs.nixvim.homeModules.nixvim
      ];
    };
  };

  users.users = {
    fovir = import ../../values/user-fovir.nix;
    root = import ../../values/user-root.nix;
  };
}
