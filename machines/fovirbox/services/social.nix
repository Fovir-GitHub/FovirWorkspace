{...}: {
  virtualisation.oci-containers.containers = {
    "elk" = {
      image = "ghcr.io/elk-zone/elk:latest";
      ports = ["127.0.0.1:1111:5314"];
      volumes = ["${import ../values/podman-data-dir.nix}/elk:/elk/data"];
    };
    "gotosocial" = {
      environment = import ../values/gotosocial-env.nix;
      image = "docker.io/superseriousbusiness/gotosocial:latest";
      ports = ["127.0.0.1:1112:8080"];
      volumes = ["${import ../values/podman-data-dir.nix}/gotosocial/data:/gotosocial/storage"];
    };
  };
}
