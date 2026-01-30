{...}: {
  virtualisation.oci-containers.containers."gotify" = {
    image = "gotify/server";

    environment = import ../values/gotify-env.nix;
    ports = ["127.0.0.1:8775:80"];
    volumes = ["${import ../values/podman-data-dir.nix}/gotify:/app/data"];
  };
}
