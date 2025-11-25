{...}: {
  virtualisation.oci-containers.containers."umami" = {
    image = "ghcr.io/umami-software/umami:postgresql-latest";
    ports = ["127.0.0.1:4000:3000"];
    environment = import ../values/umami-env.nix;
  };
}
