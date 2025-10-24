{...}: {
  home.file.".editorconfig".text = ''
    root = true

    [*]
    indent_style = space
    indent_size = 2

    trim_trailing_whitespace = true

    insert_final_newline = true

    end_of_line = lf

    charset = utf-8

    [*.{c,cpp,h,hpp,go}]
    indent_size = 4
  '';
}
