{...}: {
  virtualisation.oci-containers.containers."karakeep" = {
    image = "ghcr.io/karakeep-app/karakeep:release";
    volumes = ["${import ../values/podman-data-dir.nix}/karakeep:/data"];
    ports = ["127.0.0.1:2412:3000"];
    environment = import ../values/karakeep-env.nix;
  };
}
