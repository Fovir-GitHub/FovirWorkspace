{
  config,
  pkgs,
  ...
}: {
  home.file.".local/share/fcitx5/rime" = {
    force = true;
    recursive = true;
    source = pkgs.fetchFromGitHub {
      hash = "sha256-l1e5Zrrqlvu+86JVCBTihzl5+gIJvzXeop4VPvQG8dk=";
      owner = "FovirOS";
      repo = "rime";
      rev = "03a555a7181a04178984f05a658c6f25d368bdb3";
    };
  };

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
