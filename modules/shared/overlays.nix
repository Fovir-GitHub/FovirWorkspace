{pkgs, ...}: {
  nixpkgs = {
    overlays = [
      (_final: prev: {
        hyprpanel = prev.hyprpanel.overrideAttrs (_old: {
          src = pkgs.fetchFromGitHub {
            owner = "Fovir-GitHub";
            repo = "HyprPanel";
            rev = "839f05f262ae654e5e4fff2e07cf45bfa6f54c85";
            hash = "sha256-YNEht+K7DFGzwoELE1LCSHJ4Vj8dazUBLYGs5hAFBpI=";
          };
        });
      })
    ];
  };
}
