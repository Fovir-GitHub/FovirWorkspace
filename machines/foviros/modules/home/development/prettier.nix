{pkgs, ...}: {
  home.packages = with pkgs; [
    prettier
    prettier-plugin-go-template
  ];

  home.file.".prettierrc" = {
    text = ''
      {
        "printWidth": 72
      }
    '';
  };
}
