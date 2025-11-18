{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

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
      ./autocmd.nix # Import auto commands.
      ./colorscheme.nix # Theme.
      ./keymaps.nix # Import key maps.
      ./opts.nix # Options.
      ./plugins # Plugins settings.
    ];
  };
}
