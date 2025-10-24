{...}: {
  boot.loader = {
    systemd-boot = {
      configurationLimit = 16;
      editor = true;
      enable = true;
    };
  };
}
