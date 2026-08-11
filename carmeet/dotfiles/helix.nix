{ config, pkgs, lib, ... }: {

  programs.helix = {
    enable = true;

    settings = {
      theme = "gruvbox";

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
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }

        {
          name = "toml";
          auto-format = false;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }

        {
          name = "html";
          auto-format = false;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }

        {
          name = "hyprlang";
          auto-format = false;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }

        {
          name = "python";
          auto-format = false;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          language-servers = [ "pyright" ];
        }

        {
          name = "java";
          auto-format = false;
          roots = [
            "pom.xml"
            "build.gradle"
            ".git"
          ];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          language-servers = [ "jdtls" ];
        }

        {
          name = "c";
          auto-format = false;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }

        {
          name = "cpp";
          auto-format = false;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }

        {
          name = "json";
          auto-format = false;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
      ];
    };
  };
}
