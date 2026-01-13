{lib, ...}: {
  networking = {
    defaultGateway = {
      address = import ../values/ipv4-gateway-address.nix;
      interface = "ens3";
    };
    interfaces.ens3 = import ../values/interfaces.nix;
    useDHCP = lib.mkForce false;
  };
}
