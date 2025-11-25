{...}: {
  virtualisation.oci-containers.containers."calibre" = {
    image = "lscr.io/linuxserver/calibre-web:latest";
    environment = import ../values/calibre-env.nix;
    volumes = [
      "${import ../values/podman-data-dir.nix}/calibre:/config"
      "${import ../values/calibre-library-path.nix}:/books"
    ];
    ports = ["127.0.0.1:8083:8083"];
  };
}
