{lib, ...}: {
  services = {
    unbound = {
      enable = true;
      settings = {
        server = {
          do-ip4 = true;
          do-ip6 = true;
          do-tcp = true;
          do-udp = true;
          hide-identity = true;
          hide-version = true;
          interface = ["127.0.0.1" "::1"];
          num-threads = 2;
          prefetch = true;
          qname-minimisation = true;
          use-syslog = true;
          verbosity = 1;
        };

        forward-zone = [
          {
            forward-addr = import ../values/nameserver.nix;
            forward-tls-upstream = true;
            name = ".";
          }
        ];
      };
    };
  };

  networking = {
    dhcpcd.extraConfig = "nohook resolv.conf";
    nameservers = ["127.0.0.1" "::1"];
    resolvconf.enable = lib.mkForce false;
  };

  environment.etc."resolv.conf" = {
    mode = "0444";
    text = lib.mkForce "${import ../values/resolv-conf.nix}";
  };
}
