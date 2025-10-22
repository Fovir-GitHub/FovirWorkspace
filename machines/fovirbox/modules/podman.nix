{pkgs, ...}: {
  systemd.services.ensure-podman-networks = let
    networks = [
      "postgres"
    ];
  in {
    description = "Create podman networks.";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];
    path = with pkgs; [zfs];
    serviceConfig = {
      Type = "oneshot";
      SuccessExitStatus = "0 1";
    };
    script = ''
      ${pkgs.lib.concatMapStringsSep "\n" (network: ''
          ${pkgs.podman}/bin/podman network exists ${network} || ${pkgs.podman}/bin/podman network create ${network}
        '')
        networks}
    '';
  };
}
