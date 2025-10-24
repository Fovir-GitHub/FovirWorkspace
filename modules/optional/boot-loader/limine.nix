{...}: {
  boot.loader.limine = {
    biosSupport = true;
    efiInstallAsRemovable = true;
    efiSupport = true;
    enable = true;
    maxGenerations = 10;
    partitionIndex = 1;
  };
}
