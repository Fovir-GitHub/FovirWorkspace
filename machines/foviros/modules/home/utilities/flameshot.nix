{...}: {
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
  in [
    "$mod,S,exec,${screenshot-command}"
    ",Print,exec,${screenshot-command}"
  ];
}
