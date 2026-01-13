{...}: {
  virtualisation.oci-containers.containers = {
    # "elk" = {
    #   image = "ghcr.io/fovir-github/elk:main";
    #   ports = ["127.0.0.1:1111:5314"];
    #   pull = "always";
    #   volumes = ["${import ../values/podman-data-dir.nix}/elk:/elk/data"];
    # };
    "fe" = {
      image = "ghcr.io/fovir-github/masto-fe-standalone:latest";
      ports = ["127.0.0.1:1110:80"];
      pull = "always";
    };
    "gotosocial" = {
      environment = import ../values/gotosocial-env.nix;
      image = "docker.io/superseriousbusiness/gotosocial:latest";
      ports = ["127.0.0.1:1112:8080"];
      volumes = ["${import ../values/podman-data-dir.nix}/gotosocial/data:/gotosocial/storage"];
    };
  };
}
