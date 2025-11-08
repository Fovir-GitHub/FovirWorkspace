{...}: {
  boot.loader.limine = {
    biosSupport = true;
    efiInstallAsRemovable = true;
    efiSupport = true;
    enable = true;
    maxGenerations = 3;
    partitionIndex = 1;
  };
}
