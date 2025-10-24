{
  config,
  pkgs,
  ...
}: {
  programs.keepassxc = {
    enable = true;
  };

  home.file."${config.xdg.configHome}/keepassxc/keepassxc.ini" = {
    force = true;
    mutable = true;

    text = ''
      [Browser]
      Enabled=true

      [GUI]
      ApplicationTheme=dark
      MinimizeOnClose=true
      MinimizeToTray=true
      ShowTrayIcon=true
      TrayIconAppearance=colorful

      [General]
      MinimizeAfterUnlock=false

      [Security]
      LockDatabaseIdle=true
      LockDatabaseIdleSeconds=300
    '';
  };

  home.file.".mozilla/native-messaging-hosts/org.keepassxc.keepassxc_browser.json" = {
    force = true;
    mutable = true;

    text = ''
      {
          "name": "org.keepassxc.keepassxc_browser",
          "description": "KeePassXC integration with native messaging support",
          "path": "${pkgs.keepassxc}/bin/keepassxc-proxy",
          "type": "stdio",
          "allowed_extensions": [
              "keepassxc-browser@keepassxc.org"
          ]
      }
    '';
  };
}
