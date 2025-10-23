{...}: {
  virtualisation.oci-containers.containers."wakapi" = {
    image = "ghcr.io/muety/wakapi:latest";
    ports = [
      "127.0.0.1:3210:3000"
    ];
    environment = import ../values/wakapi-environment.nix;
    volumes = [
      "wakapi:/data:rw"
    ];
  };
}
