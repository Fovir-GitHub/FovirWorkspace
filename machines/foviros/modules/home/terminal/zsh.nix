{...}: {
  programs.zsh = {
    enable = true;

    autocd = true;
    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    defaultKeymap = "viins";

    shellAliases = {
      ls = "eza -alF --color=always --group --group-directories-first --icons=always"; # Preferred listing.
      la = "eza -a --color=always --group-directories-first --icons=always"; # All files and dirs.
      ll = "eza -l --color=always --group-directories-first --icons=always"; # Long format.
      lt = "eza -aT --color=always --group-directories-first --icons=always"; # Tree listing.

      open = "xdg-open"; # Open.

      gpa = "git push --all";
      gs = "git switch";

      cp = "cp -v";
      mv = "mv --verbose";
      rm = "rm -v";
    };

    initContent = ''
      eval "$(starship init zsh)"

      set -o vi
      bindkey -M viins '^H' backward-kill-word
    '';

    history.size = 10000;

    oh-my-zsh = {
      enable = true;

      plugins = [
        "git"
      ];
    };
  };
}
