{...}: {
  plugins.tmux-navigator = {
    enable = true;

    keymaps = [
      {
        action = "left";
        key = "<M-h>";
        options.desc = "Move to Left Window";
      }

      {
        action = "down";
        key = "<M-j>";
        options.desc = "Move to Down Window";
      }

      {
        action = "up";
        key = "<M-k>";
        options.desc = "Move to Up Window";
      }

      {
        action = "right";
        key = "<M-l>";
        options.desc = "Move to Right Window";
      }

      {
        action = "previous";
        key = "<M-o>";
        options.desc = "Move to Previous Window";
      }
    ];
  };
}
