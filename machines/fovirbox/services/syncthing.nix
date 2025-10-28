{...}: {
  virtualisation.oci-containers.containers."syncthing" = {
    image = "syncthing/syncthing";
    volumes = [
      "${import ../values/podman-data-dir.nix}/syncthing:/var/syncthing"
    ];
    ports = [
      "127.0.0.1:8384:8384"
    ];
  };
}
