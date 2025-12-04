{...}: {
  virtualisation.oci-containers.containers."redis" = {
    image = "redis:latest";
    ports = ["127.0.0.1:6379:6379"];
    volumes = ["${import ../values/podman-data-dir.nix}/redis:/data"];
    cmd = [
      "redis-server"
      "--save"
      "20"
      "1"
      "--loglevel"
      "warning"
      # "--requirepass"
      # "${import ../values/redis-password.nix}"
    ];
  };
}
