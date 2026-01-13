{...}: {
  virtualisation.oci-containers.containers."umami" = {
    autoStart = true;
    environment = import ../values/umami-env.nix;
    image = "ghcr.io/umami-software/umami:postgresql-latest";
    ports = ["127.0.0.1:4000:3000"];
    pull = "newer";
  };
}
