{...}: {
  virtualisation.oci-containers.containers."radicale" = let
    data-dir = import ../values/podman-data-dir.nix;
  in {
    image = "tomsquest/docker-radicale:latest";
    ports = ["127.0.0.1:5232:5232"];
    volumes = [
      "${data-dir}/radicale/data:/data"
      "${data-dir}/radicale/config:/config:ro"
    ];
  };
}
