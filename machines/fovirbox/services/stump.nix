{...}: {
  virtualisation.oci-containers.containers."stump" = {
    autoStart = true;
    environment = {
      PUID = "1000";
      PGID = "1000";
      STUMP_CONFIG_DIR = "/config";
    };
    image = "aaronleopold/stump:latest";
    ports = ["127.0.0.1:10801:10801"];
    volumes = [
      "${import ../values/podman-data-dir.nix}/stump:/config"
      "${import ../values/stump-data-path.nix}:/data"
    ];
  };
}
