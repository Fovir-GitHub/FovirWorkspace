{...}: {
  programs = {
    git = {
      enable = true;

      settings = {
        commit.gpgsign = true;
        init.defaultBranch = "main";
        pull.rebase = false;
        push.autoSetupRemote = true;
        tag.gpgSign = true;
        user = import ../../../values/git-user.nix;
      };
    };

    lazygit.enable = true;

    gh = {
      enable = true;

      settings.git_protocol = "ssh";
    };
  };
}
