{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      grim
      jq
      slurp
      swappy
      tesseract
      kooha
    ];
    file.".local/bin/screenshot-ocr" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        grim -g "$(slurp)" - | tesseract -l "eng" stdin stdout | wl-copy;notify-send "OCR content copied to clipboard"
      '';
    };
  };

  services.flameshot = {
    enable = true;

    settings = {
      General = {
        disabledTrayIcon = true;
        startupLaunch = true;
        showStartupLaunchMessage = false;
        savePath = "/home/fovir/Pictures/Screenshots";
        savePathFixed = true;
        showDesktopNotification = false;
      };
    };
  };

  wayland.windowManager.hyprland.settings.bind = let
    screenshot-command = "flameshot gui";
    ocr-command = "screenshot-ocr";
  in [
    "$mod,S,exec,${screenshot-command}"
    ",Print,exec,${screenshot-command}"
    "$mod,O,exec,${ocr-command}"
  ];
}
