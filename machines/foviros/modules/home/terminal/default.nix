{pkgs, ...}: {
  imports = [
    ./bash.nix
    ./fastfetch
    ./kitty.nix
    ./starship.nix
    ./zsh.nix
  ];

  home = {
    packages = with pkgs; [
      dust
      file
      rename
      rsync
      tldr
    ];
    shell.enableZshIntegration = true;
  };

  programs = {
    bat.enable = true;
    btop = {
      enable = true;

      settings = {
        color_theme = "horizon";
        vim_keys = true;
      };
    };
    eza.enable = true;
    fd.enable = true;
    ripgrep.enable = true;
    yazi.enable = true;
  };
}
