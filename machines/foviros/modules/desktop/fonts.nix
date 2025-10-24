{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      lxgw-wenkai
    ];

    fontconfig = {
      defaultFonts = {
        serif = ["JetBrainsMono Nerd Font Mono" "LXGW WenKai Mono"];
        sansSerif = ["JetBrainsMono Nerd Font Mono" "LXGW WenKai Mono"];
        monospace = ["JetBrainsMono Nerd Font Mono" "LXGW WenKai Mono"];
      };
    };
  };
}
