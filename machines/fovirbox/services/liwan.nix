{...}: {
  virtualisation.oci-containers.containers."liwan" = {
    image = "ghcr.io/explodingcamera/liwan:latest";
    ports = ["127.0.0.1:9042:9042"];
    volumes = ["liwan:/data"];
    environment = import ../values/liwan-env.nix;
  };
}
