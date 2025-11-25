{...}: {
  virtualisation.oci-containers.containers."calibre" = {
    image = "lscr.io/linuxserver/calibre-web:latest";
    environment = import ../values/calibre-env.nix;
    volumes = [
      "${import ../values/podman-data-dir.nix}/calibre/books:/books"
      "${import ../values/podman-data-dir.nix}/calibre/config:/config"
    ];
    ports = ["127.0.0.1:8083:8083"];
  };
}
