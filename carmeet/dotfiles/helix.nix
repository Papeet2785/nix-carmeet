{ lib, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      theme = lib.mkForce "onedark_custom";
      editor = {
        default-yank-register = "+";
        color-modes = true;
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
  xdg.configFile."helix/themes/onedark_custom.toml".text = ''
    inherits = "onedarker"
    "ui.background" = { bg = "#000000" }
    "ui.gutter" = { bg = "#000000" }
    "ui.statusline" = { fg = "#abb2bf", bg = "#282c34" }
    "ui.statusline.inactive" = { fg = "#5c6370", bg = "#282c34" }
    "ui.statusline.normal" = { fg = "#282c34", bg = "#e06c75"}
    "ui.statusline.insert" = { fg = "#282c34", bg = "#61afef"}
    "ui.statusline.select" = { fg = "#282c34", bg = "#e5c07b"}
  '';
}
