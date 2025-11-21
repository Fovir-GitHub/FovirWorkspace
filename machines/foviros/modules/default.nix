{username}: {
  imports = [
    (import ./software {inherit username;})
    ./desktop
    ./system
  ];
}
