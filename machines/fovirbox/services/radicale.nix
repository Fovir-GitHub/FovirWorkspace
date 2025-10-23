{...}: {
  virtualisation.oci-containers.containers."radicale" = {
    image = "tomsquest/docker-radicale:latest";
    ports = [
      "127.0.0.1:5232:5232"
    ];
    volumes = [
      "/var/lib/data/radicale/data:/data"
      "/var/lib/data/radicale/config:/config:ro"
    ];
  };
}
