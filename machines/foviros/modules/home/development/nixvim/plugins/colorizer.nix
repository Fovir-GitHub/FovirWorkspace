{...}: {
  plugins.colorizer = {
    enable = true;

    settings = {
      filetypes = [
        "css"
        "javascript"
        "javascriptreact"
        "html"
      ];

      user_default_options = {
        mode = "virtualtext";
        virtualtext = "";
      };
    };
  };
}
