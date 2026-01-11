{username, ...}: {
  imports = [
    (import ./sci.nix {inherit username;})
    ./chromium.nix
    ./direnv.nix
    ./gnupg.nix
    ./wireshark.nix
  ];
}
