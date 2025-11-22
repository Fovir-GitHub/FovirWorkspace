{...}: {
  plugins.colorizer = {
    enable = true;

    settings = {
      filetypes = [
        "css"
        "html"
        "javascript"
        "javascriptreact"
      ];

      user_default_options = {
        mode = "virtualtext";
        virtualtext = "";
      };
    };
  };
}
