{...}: {
  virtualisation.oci-containers.containers."stump" = {
    image = "aaronleopold/stump:latest";
    volumes = [
      "${import ../values/podman-data-dir.nix}/stump:/config"
      "${import ../values/stump-data-path.nix}:/data"
    ];
    ports = ["127.0.0.1:10801:10801"];
    environment = {
      PUID = "1000";
      PGID = "1000";
      STUMP_CONFIG_DIR = "/config";
    };
  };
}
