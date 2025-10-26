{lib, ...}: {
  networking = {
    useDHCP = lib.mkForce true;
    firewall.enable = false;
  };
}
