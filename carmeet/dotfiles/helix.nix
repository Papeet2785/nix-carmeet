{ lib, ... }: {
  xdg.configFile."helix/themes/onedark_custom.toml".text = ''
    inherits = "onedark"

    "ui.statusline" = { fg = "#abb2bf", bg = "#282c34" }
    "ui.statusline.inactive" = { fg = "#5c6370", bg = "#282c34" }

    "ui.statusline.normal" = {
      fg = "#ffffff"
      bg = "#a8323e"
      modifiers = ["bold"]
    }

    "ui.statusline.insert" = {
      fg = "#ffffff"
      bg = "#286090"
      modifiers = ["bold"]
    }

    "ui.statusline.select" = {
      fg = "#282c34"
      bg = "#d19a66"
      modifiers = ["bold"]
    }
  '';

  programs.helix = {
    enable = true;
    settings = {
      theme = "onedark_custom";

      editor = {
        default-yank-register = "+";
        idle-timeout = 0;
        soft-wrap.enable = true;

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        file-picker.hidden = false;
      };
    };
  };
}
