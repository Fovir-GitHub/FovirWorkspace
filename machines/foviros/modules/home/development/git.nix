{...}: {
  programs = {
    git = {
      enable = true;

      settings = {
        init.defaultBranch = "main";
        pull.rebase = false;
        push.autoSetupRemote = true;
        user = import ../../../values/git-user.nix;
      };
    };

    lazygit.enable = true;
  };
}
