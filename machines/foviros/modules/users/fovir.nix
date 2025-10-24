{...}: {
  home = {
    username = "fovir";
    homeDirectory = "/home/fovir";

    stateVersion = "25.05";
  };

  imports = [
    ../home
  ];

  programs.git = {
    enable = true;

    settings = {
      user = import ../../values/git-user.nix;
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = false;
      };
    };
  };
}
