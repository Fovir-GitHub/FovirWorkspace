{pkgs, ...}: {
  imports = [
    (import ../../../lib/ensure-path.nix {
      inherit pkgs;
      prefix = import ../values/podman-data-dir.nix;
      paths = import ../values/ensure-paths.nix;
    })
  ];
}
