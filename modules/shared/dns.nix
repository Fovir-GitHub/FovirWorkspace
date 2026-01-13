{lib, ...}: {
  services.resolved = {
    enable = true;

    dnsovertls = "opportunistic";
    domains = ["~."];
    fallbackDns = import ../values/nameserver.nix;
  };

  networking = {
    dhcpcd.extraConfig = "nohook resolv.conf";
    firewall.enable = false;
    resolvconf.enable = lib.mkForce false;
  };
}
