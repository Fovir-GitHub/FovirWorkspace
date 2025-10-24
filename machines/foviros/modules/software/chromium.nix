{...}: {
  programs.chromium = {
    enable = true;

    extensions = [
      "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
    ];
  };
}
