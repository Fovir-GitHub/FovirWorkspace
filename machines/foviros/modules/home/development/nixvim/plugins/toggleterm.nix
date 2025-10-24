{...}: {
  plugins.toggleterm = {
    enable = true;

    settings = {
      direction = "float";

      autochdir = true;
      persist_size = false;

      open_mapping = "[[<C-`>]]";

      float_opts = {
        border = "rounded";
      };
    };
  };

  extraConfigLua = ''
    function RunCurrentFile()
      local runners = {
        py = "python -u %s",
        c = "gcc -o %s *.c -g && ./%s",
        cpp = "g++ -o %s *.cpp -g && ./%s",
        go = "go build -o %s *.go && ./%s",
        js = "node %s",
        ts = "npx tsx %s",
        java = "java %s"
      }

      local filename = vim.fn.expand("%:t")
      local filename_without_ext = vim.fn.expand("%:t:r")
      local ext = vim.fn.expand("%:e")
      local file_dir = vim.fn.expand("%:p:h")

      local cmd_template = runners[ext]

      if cmd_template then
        local cmd
        if cmd_template:match("%%s.-%%s") then
          cmd = string.format(cmd_template, filename_without_ext, filename_without_ext)
        else
          cmd = string.format(cmd_template, filename)
        end

        cmd = string.format("cd %s && %s", file_dir, cmd)

        vim.cmd("TermExec cmd='" .. cmd .. "'")
      else
        print("No code runner.")
      end
    end
  '';

  keymaps = [
    {
      key = "<leader>5";
      mode = "n";
      action = ":lua RunCurrentFile()<CR>";
      options.desc = "Run Code";
    }

    {
      key = "<F5>";
      mode = "n";
      action = ":lua RunCurrentFile()<CR>";
      options.desc = "Run Code";
    }
  ];
}
