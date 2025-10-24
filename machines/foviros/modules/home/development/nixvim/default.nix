{...}: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals = {
      mapleader = " "; # Set space as the leader key.
    };

    diagnostic.settings = {
      virtual_text = true;
    };

    editorconfig = {
      enable = true;
    };

    imports = [
      ./colorscheme.nix # Theme.
      ./plugins # Plugins settings.
      ./opts.nix # Options.
      ./keymaps.nix # Import key maps.
      ./autocmd.nix # Import auto commands.
    ];
  };
}
