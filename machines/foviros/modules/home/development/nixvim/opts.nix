{pkgs, ...}: {
  extraConfigVim = ''
    set clipboard+=unnamedplus
  '';

  extraConfigLua = ''
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_opacity = 0.9
    vim.g.neovide_normal_opacity = 0.9
    vim.o.shell="${pkgs.zsh}/bin/zsh"

    vim.g.user_emmet_expandabbr_key = "<M-,>";
  '';

  opts = {
    # Configure tab behaviours.
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 4;
    expandtab = true;

    # Show line number and relative line number.
    number = true;
    relativenumber = true;

    # Use terminal's color.
    termguicolors = true;

    # Automatically indent and smart indent.
    autoindent = true;
    smartindent = true;

    # Highlight current line.
    cursorline = true;

    # Search with case-insenstive.
    ignorecase = true;
    smartcase = true;

    # Enable spell check.
    spelllang = "en_US";

    formatoptions = "croq";

    # Enable line wrap.
    wrap = true;
    linebreak = true;
  };
}
