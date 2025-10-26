{...}: {
  virtualisation.oci-containers.containers."openlist" = {
    image = "openlistteam/openlist:latest";
    volumes = [
      "/var/lib/data/openlist:/opt/openlist/data"
    ];
    ports = [
      "127.0.0.1:5244:5244"
    ];
    user = "0:0";
    environment = import ../values/openlist-env.nix;
  };
}
