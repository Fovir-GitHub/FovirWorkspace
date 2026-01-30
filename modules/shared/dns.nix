{lib, ...}: {
  services.resolved = {
    enable = true;

    settings.Resolve = {
      DnsOverTLS = "opportunistic";
      Domains = ["~."];
      FallbackDns = import ../values/nameserver.nix;
    };
  };

  networking = {
    dhcpcd.extraConfig = "nohook resolv.conf";
    resolvconf.enable = lib.mkForce false;
  };
}
