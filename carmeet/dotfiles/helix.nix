{ config, pkgs, lib, ... }: {
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
          auto-format = true;
        }
        {
          name = "nix";
          auto-format = true;
        }
        {
          name = "html";
          auto-format = true;
        }
        {
          name = "python";
          auto-format = true;
        }
        {
          name = "java";
          auto-format = true;
        }
        {
          name = "c";
          auto-format = true;
        }
        {
          name = "cpp";
          auto-format = true;
        }
      ];
    };
  };
}
