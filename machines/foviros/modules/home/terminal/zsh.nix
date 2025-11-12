{pkgs, ...}: let
  iconPathPrefix = "${pkgs.beauty-line-icon-theme}/share/icons/BeautyLine/apps/scalable";
  successIcon = "${iconPathPrefix}/gnome-info.svg";
  failedIcon = "${iconPathPrefix}/error.svg";
in {
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
      tempdir = "cd $(mktemp -d)";
    };

    initContent = ''
      eval "$(starship init zsh)"

      set -o vi
      bindkey -M viins '^H' backward-kill-word

      bgnotify_threshold=10
      function bgnotify_formatted {
        ## $1=exit_status, $2=command, $3=elapsed_time
        local elapsed="$(( $3 % 60 ))s"
        (( $3 < 60 ))   || elapsed="$((( $3 % 3600) / 60 ))m $elapsed"
        (( $3 < 3600 )) || elapsed="$((  $3 / 3600 ))h $elapsed"

        [ $1 -eq 0 ] && icon="${successIcon}" || icon="${failedIcon}"
        bgnotify "took ''${elapsed}" "$2" "$icon"
      }
    '';

    history.size = 10000;

    oh-my-zsh = {
      enable = true;

      plugins = [
        "git"
        "bgnotify"
      ];
    };
  };
}
