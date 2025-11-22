{
  config,
  pkgs,
  ...
}: {
  #   home.file.".local/share/fcitx5/rime" = {
  #     force = true;
  #     recursive = true;
  #     source =
  #       pkgs.fetchFromGitHub {
  #         hash = "sha256-/5OJPess4VkHhJ6UIoBH+Llj0OAWNdjHki7t8smzk3c
  # =";
  #         owner = "Fovir-GitHub";
  #         repo = "rime";
  #         rev = "16b232b88e181ab74b4e881e466797ab25222e66";
  #       };
  #   };

  home.file."${config.xdg.configHome}/fcitx5/conf/rime.conf".text = ''
    # Preedit Mode
    PreeditMode="Do not show"
    # Shared Input State
    # InputState=All
    # Fix embedded preedit cursor at the beginning of the preedit
    # PreeditCursorPositionAtBeginning=True
    # Action when switching input method
    # SwitchInputMethodBehavior="Commit commit preview"
    # Deploy
    Deploy=
    # Synchronize
    Synchronize=
  '';
}
