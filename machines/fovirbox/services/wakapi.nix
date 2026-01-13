{...}: {
  virtualisation.oci-containers.containers."wakapi" = {
    autoStart = true;
    environment = import ../values/wakapi-environment.nix;
    image = "ghcr.io/muety/wakapi:latest";
    ports = ["127.0.0.1:3210:3000"];
    volumes = ["${import ../values/podman-data-dir.nix}/wakapi:/data:rw"];
  };
}
