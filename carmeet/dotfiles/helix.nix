{ lib, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = lib.mkForce "base16_default";
      editor = {
        default-yank-register = "+";
        idle-timeout = 0;
        soft-wrap.enable = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        file-picker = {
          hidden = false;
        };
      };
    };
    languages.auto-format = false;
  };
}
