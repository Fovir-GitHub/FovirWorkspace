{pkgs, ...}: {
  environment.etc = {
    "caddy/self-sign.crt" = {
      mode = "0755";
      text = import ../values/caddy-self-sign-crt.nix;
    };
    "caddy/self-sign.key" = {
      mode = "0755";
      text = import ../values/caddy-self-sign-key.nix;
    };
  };

  services.caddy = {
    enable = true;

    configFile = pkgs.writeText "Caddyfile" ''
      {
        auto_https disable_certs
        servers {
          max_header_size 10240MB
        }
      }
    '';
  };
}
