{...}: {
  virtualisation.oci-containers.containers."fusion" = {
    image = "ghcr.io/fovir-github/fusion:main";
    pull = "always";
    ports = ["127.0.0.1:8080:8080"];
    environment = import ../values/fusion-env.nix;
    volumes = ["${import ../values/podman-data-dir.nix}/fusion:/data"];
  };
}
