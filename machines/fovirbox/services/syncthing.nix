{...}: {
  virtualisation.oci-containers.containers."syncthing" = {
    autoStart = true;
    image = "syncthing/syncthing";
    ports = ["127.0.0.1:8384:8384"];
    volumes = ["${import ../values/podman-data-dir.nix}/syncthing:/var/syncthing"];
  };
}
