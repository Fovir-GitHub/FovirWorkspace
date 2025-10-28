{...}: {
  virtualisation.oci-containers.containers."wakapi" = {
    image = "ghcr.io/muety/wakapi:latest";
    ports = [
      "127.0.0.1:3210:3000"
    ];
    environment = import ../values/wakapi-environment.nix;
    volumes = [
      "${import ../values/podman-data-dir.nix}/wakapi:/data:rw"
    ];
  };
}
