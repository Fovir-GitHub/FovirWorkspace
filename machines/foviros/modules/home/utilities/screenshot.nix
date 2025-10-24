{pkgs, ...}: {
  home.packages = with pkgs; [
    grim
    jq
    slurp
    swappy
    tesseract
  ];

  home.file.".local/bin/screenshot-ocr.sh" = {
    text = ''
      #!/usr/bin/env bash

      grim -g "$(slurp)" - | tesseract -l "eng" stdin stdout | wl-copy;notify-send "OCR content copied to clipboard"
    '';

    executable = true;
  };
}
