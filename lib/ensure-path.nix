# Ensure `prefix/paths` exist before `podman` service.
{
  pkgs,
  prefix,
  paths,
}: {
  systemd.services.ensure-path = {
    wantedBy = ["multi-user.target"];
    before = ["podman.service"];
    description = "Ensure paths with prefix.";
    path = with pkgs; [zfs];
    serviceConfig = {
      Type = "oneshot";
      SuccessExitStatus = "0 1";
      ExecStart = map (path: "${pkgs.coreutils}/bin/mkdir -p ${prefix}/${path}") paths;
    };
  };
}
