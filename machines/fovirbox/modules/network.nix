{lib, ...}: {
  networking = {
    useDHCP = lib.mkForce false;
    firewall.enable = false;
    interfaces.ens3 = import ../values/interfaces.nix;

    defaultGateway = {
      address = import ../values/ipv4-gateway-address.nix;
      interface = "ens3";
    };
  };
}
