{pkgs, ...}: {
  imports = [
    (import ../../../lib/ensure-path.nix {
      inherit pkgs;
      prefix = "/var/lib/data";
      paths = import ../values/ensure-paths.nix;
    })
  ];
}
