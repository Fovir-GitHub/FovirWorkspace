{pkgs, ...}: {
  virtualisation.oci-containers.containers."postgres" = {
    image = "postgres:17";
    autoStart = true;
    environment = import ../values/postgres-environment.nix;
    volumes = [
      "/var/lib/data/postgres:/var/lib/postgresql/data:rw"
    ];
    ports = [
      "127.0.0.1:5432:5432"
    ];
  };

  systemd.services.auto-create-user-db = {
    wantedBy = ["multi-user.target"];
    after = ["podman-postgres.service"];
    # requires = ["podman-postgres.service"];
    description = "Initialize PostgreSQL users and databases";
    # Without this line, it would Error: configure storage: the 'zfs' command is not available: prerequisites for driver not satisfied (wrong filesystem?)
    path = with pkgs; [zfs];
    serviceConfig = {
      Type = "oneshot";
      SuccessExitStatus = "0 1";
      ExecStart = ''
        ${pkgs.podman}/bin/podman exec -i postgres \
        psql -U postgres
      '';
    };
  };
}
