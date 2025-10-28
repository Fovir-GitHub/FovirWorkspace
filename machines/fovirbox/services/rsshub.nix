{...}: {
  virtualisation.oci-containers.containers."rsshub" = {
    image = "diygod/rsshub:latest";
    ports = [
      "127.0.0.1:1200:1200"
    ];
    environment = import ../values/rsshub-env.nix;
  };
}
