{...}: {
  virtualisation.oci-containers.containers."syncthing" = {
    image = "syncthing/syncthing";
    volumes = [
      "/var/lib/data/syncthing:/var/syncthing"
    ];
    ports = [
      "127.0.0.1:8384:8384"
    ];
  };
}
