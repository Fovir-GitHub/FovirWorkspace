{inputs, ...}: {
  boot = {
    kernelPackages = inputs.chaotic.legacyPackages.x86_64-linux.linuxPackages_cachyos-server;
  };

  services = {
    openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        AllowUsers = null;
        PasswordAuthentication = false;
        PermitRootLogin = "yes";
        PubkeyAuthentication = "yes";
        UseDns = false;
        X11Forwarding = false;
      };
    };
  };

  time.timeZone = "Asia/Kuala_Lumpur";
}
