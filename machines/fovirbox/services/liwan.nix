{pkgs, ...}: let
  geoIP = pkgs.fetchurl {
    url = "https://downloads.ip66.dev/db/ip66.mmdb";
    hash = "sha256-qWSi4HgzVEbfYvb/poZrU/ZZeeI67b9Ql45eiitBJBU=";
  };
in {
  virtualisation.oci-containers.containers."liwan" = {
    image = "ghcr.io/explodingcamera/liwan:latest";
    ports = ["127.0.0.1:9042:9042"];
    volumes = [
      "${geoIP}:/geoip/geoip.mmdb"
      "liwan:/data"
    ];
    environment = import ../values/liwan-env.nix;
  };
}
