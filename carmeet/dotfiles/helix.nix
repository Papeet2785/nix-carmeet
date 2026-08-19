{ config, pkgs, lib, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = lib.mkForce "gruvbox_dark_hard";
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
    languages = {
      language = [
        {
          name = "bash";
          auto-format = false;
        }
        {
          name = "nix";
          auto-format = false;
        }
        {
          name = "html";
          auto-format = false;
        }
        {
          name = "python";
          auto-format = false;
        }
        {
          name = "java";
          auto-format = false;
        }
        {
          name = "c";
          auto-format = false;
        }
        {
          name = "cpp";
          auto-format = false;
        }
      ];
    };
  };
}
