{pkgs, ...}: {
  programs.chromium = {
    enable = true;

    commandLineArgs = [
      "--enable-wayland-ime"
      "--ozone-platform=wayland"
      "--ozone-platform-hint=auto"
      "--password-store=basic"
    ];

    package = pkgs.brave;
  };
}
