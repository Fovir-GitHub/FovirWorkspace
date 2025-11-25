{pkgs, ...}: {
  environment.systemPackages = [pkgs.restic];

  environment.etc = import ../values/restic-etc.nix;
  services.restic.backups.s3 = import ../values/restic-s3.nix;
}
