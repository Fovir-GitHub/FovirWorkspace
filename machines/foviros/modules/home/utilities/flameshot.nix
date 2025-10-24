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
}
