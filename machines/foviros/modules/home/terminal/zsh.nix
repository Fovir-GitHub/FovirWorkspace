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

      preexec () {
          CMD_START_DATE=$(date +%s)
          CMD_NAME=$1
      }
      precmd () {
          if ! [[ -z $CMD_START_DATE ]]; then
              CMD_END_DATE=$(date +%s)
              CMD_ELAPSED_TIME=$(($CMD_END_DATE - $CMD_START_DATE))
              # Store an arbitrary threshold, in seconds.
              CMD_NOTIFY_THRESHOLD=10

              if [[ $CMD_ELAPSED_TIME -gt $CMD_NOTIFY_THRESHOLD ]]; then
                  # Send a notification
                  notify-send 'Job finished' "The job \"$CMD_NAME\" has finished."
              fi
          fi
      }
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
