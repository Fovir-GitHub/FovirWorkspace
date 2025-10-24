{
  config,
  lib,
  pkgs,
  ...
}: {
  xdg = {
    enable = true;

    configHome = "${config.home.homeDirectory}/.config";
    portal = {
      enable = true;

      config = {
        common = {
          default = "hyprland";
        };
      };
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
    };

    userDirs = {
      enable = true;

      createDirectories = false;
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      videos = "$HOME/Videos";
      desktop = "$HOME/Desktop";
      templates = "/var/empty";
      publicShare = "/var/empty";
      extraConfig = {
        XDG_PROJECTS_DIR = "$HOME/Projects";
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
    desktopEntries = {
      nemo = {
        name = "Nemo";
        exec = "${config.home.homeDirectory}/.local/bin/run-nemo.sh";
      };
    };

    mimeApps = let
      browser = ["firefox-devedition.desktop"];
      filemanager = ["nemo.desktop"];
      image-viewer = ["oculante.desktop"];
      video-player = ["mpv.desktop"];
      libreoffice-writer = ["libreoffice-writer.desktop"];
      libreoffice-calc = ["libreoffice-calc.desktop"];
      libreoffice-presentation = ["libreoffice-impress.desktop"];
    in {
      enable = true;

      defaultApplications = {
        "x-scheme-handler/about" = filemanager;
        "x-scheme-handler/ftp" = filemanager;
        "inode/directory" = filemanager;

        "image/*" = image-viewer;
        "image/avif" = image-viewer;
        "image/gif" = image-viewer;
        "image/jpeg" = image-viewer;
        "image/png" = image-viewer;
        "image/webp" = image-viewer;

        "audio/*" = video-player;
        "video/*" = video-player;

        "application/pdf" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "text/html" = browser;

        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = libreoffice-writer;
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = libreoffice-calc;
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = libreoffice-presentation;
      };
    };
  };

  home.activation.createRunNemo = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p ${config.home.homeDirectory}/.local/bin
  '';

  home.file.".local/bin/run-nemo.sh" = {
    text = ''
      #!/usr/bin/env bash

      ( nohup nemo $1 >/dev/null 2>&1 & ) >/dev/null 2>&1
    '';

    executable = true;
  };

  home.activation.createProjects = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p $HOME/Projects
  '';
}
