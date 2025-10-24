{lib, ...}: {
  networking.networkmanager = {
    enable = true;

    dns = lib.mkDefault "none";
    insertNameservers = import ../../values/name-servers.nix;
  };
}
