{...}: {
  networking.networkmanager = {
    enable = true;

    dns = "none";
    insertNameservers = import ../../values/name-servers.nix;
  };
}
