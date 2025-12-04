{...}: {
  virtualisation.oci-containers.containers = {
    "sharelatex" = {
      image = "sharelatex/sharelatex";
      ports = ["127.0.0.1:2521:80"];
      volumes = ["${import ../values/podman-data-dir.nix}/sharelatex:/var/lib/overleaf"];
      environment = import ../values/sharelatex-env.nix;
    };
    "mongo" = {
      image = "mongo:8.0";
      cmd = [
        "--replSet"
        "overleaf"
      ];
      volumes = ["${import ../values/podman-data-dir.nix}/mongo:/data/db"];
      environment = import ../values/mongo-env.nix;
    };
  };
}
