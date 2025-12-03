{pkgs, ...}: {
  programs.java = let
    customJava = pkgs.jdk21.override {
      enableJavaFX = true;
      openjfx_jdk = pkgs.openjfx.override {withWebKit = true;};
    };
  in {
    enable = true;
    package = customJava;
  };
}
