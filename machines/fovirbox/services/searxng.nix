{...}: {
  virtualisation.oci-containers.containers."searxng" = {
    image = "searxng/searxng:latest";
    ports = ["127.0.0.1:8888:8080"];
    volumes = let
      searxng-path = "${import ../values/podman-data-dir.nix}/searxng";
    in [
      "${searxng-path}/config:/etc/searxng"
      "${searxng-path}/data:/var/cache/searxng"
    ];
    environment = import ../values/searxng-env.nix;
  };
}
