{...}: {
  virtualisation.oci-containers.containers."fusion" = {
    autoStart = true;
    environment = import ../values/fusion-env.nix;
    image = "ghcr.io/fovir-github/fusion:main";
    ports = ["127.0.0.1:8080:8080"];
    pull = "always";
    volumes = ["${import ../values/podman-data-dir.nix}/fusion:/data"];
  };
}
