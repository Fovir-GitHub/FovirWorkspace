{...}: {
  programs = {
    git = {
      enable = true;

      settings = {
        user = import ../../../values/git-user.nix;
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };

    lazygit.enable = true;
  };
}
