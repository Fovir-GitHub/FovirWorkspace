{...}: {
  virtualisation.oci-containers.containers."fusion" = {
    image = "ghcr.io/0x2e/fusion:latest";
    ports = [
      "127.0.0.1:8080:8080"
    ];
    environment = import ../values/fusion-env.nix;
    volumes = [
      "${import ../values/podman-data-dir.nix}/fusion:/data"
    ];
  };
}
